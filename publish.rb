TEMP_PATH = '/tmp/soe'

`git checkout master`
`coffee --compile -o lib src`
# Soft try first: don't obliterate changes
output = `git checkout gh-pages 2>&1`
# Raise if it's an error about non-generated code
raise "Please deal with uncommited files: #{output}" if output.include?('tree files would be overwritten') && !(output =~ /lib\/.*\.js/)
`cp -r . #{TEMP_PATH}`
`git checkout -f gh-pages`

# Remove everything except for .git and .gitignore
everything = Dir.entries('.')
everything.map { |e| `rm -rf #{e}` unless e.include?('.git') || e.include?('publish.rb') }

`cp -r #{TEMP_PATH}/* .`
`git add .`
puts "Ready to commit."

