#!/usr/bin/env ruby

require 'rubygems'
require 'spreadsheet'
require 'ruby18_source_location'
require 'fileutils'
require 'ruby-debug'


def get_new_temp_report_path
  FileUtils.mkdir_p(base_path = Pathname.pwd.join('tmp', 'report'))
  true while File.exist?(path = base_path.join((12.times.map{ (('A'..'Z').to_a)[rand 26]}.join)))
  FileUtils.touch(path)
  path
end

def redoit

  params = {}
  params[:spreadsheet] = "/Users/cmagid/Downloads/Content_upload_Master_27TH_FEB.xls"
  file_path = get_new_temp_report_path
  FileUtils.copy(params[:spreadsheet], file_path)

  @header = Spreadsheet.open(file_path).worksheet(0).first.to_a.compact
  flash = {}
  flash[:file_path] = file_path

  data = File.read(flash[:file_path])
#  data = data.gsub(/[\n\r]+/, "\n")

  options = {}
  options[:has_header_row] = true

  Spreadsheet.client_encoding = 'UTF-8'
  input = StringIO.new(data)
  rows = []
  book = Spreadsheet.open(input)
  sheet = book.worksheet 0
  sheet.each { |row| puts row[0] }
end

ARGV.each do|a|
  redoit
end


