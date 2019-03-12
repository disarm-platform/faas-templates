#!/usr/bin/env ruby

REPO_VERSION_FILE_NAME = "VERSION"
TEMPLATE_VERSION_FILE_NAME = "TEMPLATE_VERSION"

def fn_dirs
  Dir.glob("template/*")
end

def update_file(version, file)
  File.open(file, "w") { |file| file.write(version) }
  puts "Wrote #{file}"
end

def version_file_path(dir)
  File.join(dir, "function", TEMPLATE_VERSION_FILE_NAME)
end

def current_version
  "0.0.7"
end

def next_version
  # bump current_version
  "0.0.8"
end

def update_all_template_version_file
  fn_dirs.each do |dir|
    version_file = version_file_path(dir)
    update_file(next_version, version_file)
  end
end

def repo_version_file_path
  REPO_VERSION_FILE_NAME
end

def update_repo_version_file
  File.open(REPO_VERSION_FILE_NAME, "w") { |file| file.write(next_version) }
  puts "Wrote #{repo_version_file_path}"
end

def commit_updates
  files = fn_dirs.map do |dir|
    version_file_path(dir)
  end
  puts files
  exec "git add #{files.join " "}"
  exec "git commit -m 'bumped to version #{next_version}'"
end

def bump_git_tag
  exec "git tag #{next_version}"
  puts "Bump git tag to #{next_version}" # Bump the git tag to match
end

def do_all
  puts ">> Updating to: #{next_version}" # Log the plan

  update_repo_version_file
  update_all_template_version_file
  commit_updates
  # bump_git_tag

  puts "Complete"
end

do_all
