#!/usr/bin/env ruby

REPO_VERSION_FILE_NAME = "VERSION"
TEMPLATE_VERSION_FILE_NAME = "TEMPLATE_VERSION"

def fn_dirs
  Dir.glob("template/*")
end

def update_file(tag, file)
  File.open(file, "w") { |file| file.write(tag) }
  puts "Wrote #{file}"
end

def version_file_path(dir)
  File.join(dir, "function", TEMPLATE_VERSION_FILE_NAME)
end

def current_version
  if File.exists?(REPO_VERSION_FILE_NAME)
    File.read(REPO_VERSION_FILE_NAME)
  end
end

def update_all_template_version_file(next_version)
  fn_dirs.each do |dir|
    version_file = version_file_path(dir)
    update_file(next_version, version_file)
  end
end

def repo_version_file_path
  REPO_VERSION_FILE_NAME
end

def update_repo_version_file(next_version)
  File.open(REPO_VERSION_FILE_NAME, "w") { |file| file.write(next_version) }
  puts "Wrote #{repo_version_file_path}"
end

def commit_updates(next_version)
  files = fn_dirs.map do |dir|
    version_file_path(dir)
  end
  `git add #{files.join " "} #{REPO_VERSION_FILE_NAME}`
  `git commit -m 'version #{next_version}'`
end

def bump_git_tag(next_version)
  `git tag #{next_version}`
  puts "Set git tag" # Bump the git tag to match
end

def tag_exists(next_version)
  `git rev-parse #{next_version} 2>/dev/null`
  $?.exitstatus == 0
end

def check_tag_exists(next_version)
  if tag_exists(next_version)
    puts "Tag #{next_version} already exists - stopping"
    exit
  end
end

def do_all(next_version)
  puts ">> Updating to: #{next_version}" # Log the plan

  check_tag_exists(next_version)
  update_repo_version_file(next_version)
  update_all_template_version_file(next_version)
  commit_updates(next_version)
  bump_git_tag(next_version)

  puts "Complete"
end

def is_probably_semver(version_arg)
  version_arg.strip.match? /^v?\d+\.\d+\.\d+$/
end

# Make sure the version starts with a 'v'
def tag
  if version_arg.match /^v/
    version_arg
  else
    "v#{version_arg}"
  end
end

def version_arg
  ARGV[0]
end

def start
  if version_arg
    # Update to the given version - can either contain initial 'v' or not - it will be added
    puts "Warning: - #{version_arg} does not look to be a semantic version" unless is_probably_semver version_arg
    do_all tag
  else
    # Print out current_version
    if current_version
      puts "Current version is #{current_version}"
    else
      puts "No VERSION file found"
    end
  end
end

start
