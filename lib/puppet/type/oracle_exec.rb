require 'pathname'
$:.unshift(Pathname.new(__FILE__).dirname.parent.parent)
$:.unshift(Pathname.new(__FILE__).dirname.parent.parent.parent.parent + 'easy_type' + 'lib')
require 'easy_type'
require 'utils/oracle_access'
require 'utils/title_parser'


module Puppet
  #
  # Create a new type oracle_user. Oracle user, works in conjunction 
  # with the SqlResource
  #
  newtype(:oracle_exec) do
    include EasyType
    include ::Utils::OracleAccess
    extend Utils::TitleParser

    desc "This resource allows you to execute any sql command in a database"

    map_title_to_sid(:statement) { /^((.*?\/)?(.*)?)$/}

    parameter :name
    property  :statement
    parameter :sid

    parameter :timeout
    parameter :logoutput
    parameter :password
    parameter :username

  end


end



