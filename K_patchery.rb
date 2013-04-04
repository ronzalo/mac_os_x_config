#!/usr/bin/env ruby

# USAGE:
# Steel yourself.
# Open two terminal windows
# Run it
#   Arguments are optional, but if you're feeling
#   argumentative you can pass it a treesish.
#   If you do it'll use that for cherry-picking
#   instead of performing a merge.
# After (un)successfully merging release-0012.1
#   into one of the r12 client branches:
#   Switch to the second terminal window
#   Test
#   Push upstream
#   Switch back to first terminal window
#   Follow onscreen instructions
#
# Perform the socially acceptable ceremony that most
# closely approximates having a smoke after a job well done
# and won't get you fired or arrested.



## supporting methods
PROGRESS_FILE = 'mergination_progress.txt'
def handle_response(input, match_this, prior_branches)
  if input.match(/[qQ]/)
    quit(prior_branches)
  end
  if input.match(/#{match_this}/i)
    return true
  end

  return false
end

def quit(prior_branches)
    puts "Quitting"
    record_progress(prior_branches)
    exit(0)
end

def record_progress(prior_branches)
  File.open(PROGRESS_FILE, 'w') {|f|
    f.write(prior_branches.compact.uniq.join("\n"))
  }
end

# returns the name of current git branch
def get_git_branch()
  return `git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \\(.*\\)/\\1/"`.strip
end

def checkout_branch(branch_name)
  checkout_response = `git checkout #{branch_name} 2>&1`
  #puts "checkout_response: #{checkout_response}"
  #checkout_response = checkout_response.split(/\n/)
  if (checkout_response.first =~ /Your local changes to the following files would be overwritten by checkout:/)
    stash_message = "r2_patchery: #{get_git_branch()}"
    puts "Stashing your changes with message: #{stash_message}"
    `git stash save #{stash_message}` #spaces are fine
    checkout_branch(branch_name)
  end
end


###########################
# Procedural goodness

# 1st Lookup all the remote repos
# we could use Grit, but I'm thinking shell calls
# will be more than sufficent here.

R12_CORE_REPO = 'release-0012.1'
prior_branches = []
  # branches we've either merged into or skipped
  # ... things we can ignore on future runs
cherry_to_pick = ARGV[0]
unless cherry_to_pick.nil?
  ARGV.clear
    # otherwise it'll shove ARGV[0]
    # into our first real gets call
    # which seems kinda ... silly
end

remote_branches = `git branch -a  2>&1`
#puts "remote_branches: #{remote_branches.inspect}"
if remote_branches =~ /Not a git repository/
  puts "Get thee to a gittery! - William Gitspeare"
  exit(1)
end



if File.exists?(PROGRESS_FILE)
  puts "Oooh. I found a progress file from a prior run (#{PROGRESS_FILE})."
  puts "Hit return to pick up where we left off. Hit x to ignore it."
  input = gets.strip
  if ! handle_response(input, 'x', prior_branches)
    file = File.new(PROGRESS_FILE, "r")
    while (line = file.gets)
        prior_branches.push(line.strip) unless line =~ /^$/
    end
  end
  prior_branches = prior_branches.compact.uniq
  puts "Branches that've been addressed or skipped: \n\t* #{prior_branches.join("\n\t* ")}"
end




remote_branches = remote_branches.split( /\n/ )
remote_branches.each do |full_branch_name|
  #puts full_branch_name

  remotes, repo, branch_name = full_branch_name.split('/')

  if (branch_name =~ /release-0012\.1\.\w+$/ and repo =='origin')

    next if prior_branches.include? branch_name # skip ones we've done before

    puts "Want me to merge into #{repo}/#{branch_name}? (y/n/q)"
    input = gets.strip
    if handle_response(input, 'y', prior_branches)
      puts "Checking out #{repo}/#{branch_name}"
      checkout_response =  `git checkout -t #{repo}/#{branch_name} 2>&1`
      if (checkout_response =~ /fatal: A branch named '#{branch_name}' already exists/)
        puts "already exists... switching to it"
        checkout_branch(branch_name)
        pull_response = `git pull`
      end
      puts "checkout_response: #{checkout_response}"
      command = nil
      if (cherry_to_pick.nil?)
        puts "Merging..."
        command = "git merge #{R12_CORE_REPO}"
      else
        puts "Cherry-picking..."
        command = "git cherry-pick #{cherry_to_pick}"
      end

      mergination = `#{command} 2>&1`.split(/\n/)
      puts mergination
      if (mergination.last =~ /fatal|Automatic merge failed/ || mergination.first =~ /error/)
        puts "\n\n\n####################################"
        puts "I see... Yes. Well then. I'll leave you to address this."
        puts "Rerun me when you're done and I'll start at the next branch."

        puts "P.S. to abort this merge just run \ngit reset hard --HEAD"
        prior_branches.push(branch_name)
        quit(prior_branches)
      end
    else
      prior_branches.push(branch_name)
      puts "Skipping #{branch_name}"
    end
  elsif (branch_name =~ /release-0012\.1\.\S+/)
    #puts "Skipping #{branch_name}. Looks like a topic branch to me"
    prior_branches.push(branch_name)
  end
  record_progress(prior_branches)
end
puts "Removing progress file."
if File.exists? PROGRESS_FILE
  File.delete PROGRESS_FILE
end


#
