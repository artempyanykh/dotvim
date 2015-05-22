require 'pathname'
require 'fileutils'
require 'etc'
require 'os'

task default: %w( setup )

task :setup => [
  :copy_vim_settings,
  :setup_fonts,
  :fetch_vundle,
  :install_plugins,
  :install_you_complete_me
]

task :update => [:clear_vundle, :setup]

task :copy_vim_settings do
  [".vim", ".vimrc", ".gvimrc", ".ideavimrc"].each do |target|
    link_to_home(dotfiles_mapping(target), target)
  end
end

task :setup_fonts do
  dest_dir = under_user_dir(".fonts")
  mkdir_p dest_dir

  fonts = Dir.glob(under_current_dir "fonts/*.otf")
  cp fonts, dest_dir
end

task :fetch_vundle do
  sh "git submodule init"
  sh "git submodule update"
end

task :clear_vundle do
  rm_rf under_current_dir("bundle").to_s
end

task :install_plugins do
  boot_vimrc = under_current_dir("boot_vimrc").to_s
  sh "vim -u #{boot_vimrc} +BundleInstall +qall"
end

task :install_you_complete_me do
  ycm_path = under_current_dir("bundle/YouCompleteMe")

  if ycm_path.exist?
    command = "#{ycm_path}/install.sh"
    sh command
  end
end

def dotfiles_mapping(target)
  case target
  when ".vim" then "."
  when ".vimrc" then "vimrc"
  when ".gvimrc" then OS.mac? ? "macvimrc" : "gvimrc"
  when ".ideavimrc" then "ideavimrc"
  end
end

def link_to_home(source, target, force: true)
  ln_s under_current_dir(source), under_user_dir(target), force: force
end

def under_current_dir(filename)
  current_dir + filename
end

def under_user_dir(filename)
  user_dir + filename
end

def user_dir
  Pathname.new Etc.getpwnam(Etc.getlogin).dir
end

def current_dir
  Pathname.new(File.dirname File.expand_path(__FILE__))
end
