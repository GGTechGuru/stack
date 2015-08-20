# Abstract classes for recurring stuff.
# Copyright: Gerard Gold and assigns.

module AbsClasses

  # Abstract comparison of reference values from DB with
  # actual values returned from API.

  require 'abstraction'

  # Probably no subclasses in this file to avoid clutter,
  # so can remove SQL/REST-specific loads.
  require 'mysql2'
  require 'rest-client'

  ################################################

  class ApiCmpAbs
    abstract

    def initialize()
    end

    db_host = ''
    db_user = ''
    db_pwd = ''

    ########################################################
    # Return just the data expected from the API - as a hash
    # params_hash: for the data connection & query
    def db_data_ref( params_hash )
      raise NoMethodError, 'Subclass defines: expected API data.'
    end
  
    ###########################################################
    # Build the API specific to the subclass
    # params_hash: Domain & other components of the full API URL
    def build_api( params_hash )
      raise NoMethodError, 'Subclass defines: Build (multipart) API'
    end
  
    ###########################################################
    # Call the API return the data as a hash
    # params_hash: if non-nil, method & data to API. Other GET.
    def build_api( api_url, params_hash=nil )
      raise NoMethodError, 'Subclass defines: Call API, return hash'
    end

    ###########################################################
    # Compare the expected data with that returned from the API call.
    def cmp_api_ref( ref_data_hash, data_hash )
      raise NoMethodError, 'Subclass defines: compare API & ref data'
    end

  ################################################

  end # ApiCmpAbs

################################################

end # module AbsClasses
include AbsClasses
