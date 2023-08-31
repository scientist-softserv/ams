Hyrax.config do |config|
  # Injected via `rails g hyrax:work Asset`
  config.register_curation_concern :asset
  # Injected via `rails g hyrax:work PhysicalInstantiation`
  config.register_curation_concern :physical_instantiation
  # Injected via `rails g hyrax:work DigitalInstantiation`
  config.register_curation_concern :digital_instantiation
  # Injected via `rails g hyrax:work EssenceTrack`
  config.register_curation_concern :essence_track
  # Injected via `rails g hyrax:work Contribution`
  config.register_curation_concern :contribution

  # Injected via `rails g hyrax:work_resource AssetResource`
  config.register_curation_concern :asset_resource
  # Injected via `rails g hyrax:work_resource PhysicalInstantiationResource`
  config.register_curation_concern :physical_instantiation_resource
  # Injected via `rails g hyrax:work_resource DigitalInstantiationResource`
  config.register_curation_concern :digital_instantiation_resource
  # Injected via `rails g hyrax:work_resource EssenceTrackResource`
  config.register_curation_concern :essence_track_resource
  # Injected via `rails g hyrax:work_resource ContributionResource`
  config.register_curation_concern :contribution_resource

  # Register roles that are expected by your implementation.
  # @see Hyrax::RoleRegistry for additional details.
  # @note there are magical roles as defined in Hyrax::RoleRegistry::MAGIC_ROLES
  # config.register_roles do |registry|
  #   registry.add(name: 'captaining', description: 'For those that really like the front lines')
  # end

  # When an admin set is created, we need to activate a workflow.
  # The :default_active_workflow_name is the name of the workflow we will activate.
  # @see Hyrax::Configuration for additional details and defaults.
  # config.default_active_workflow_name = 'default'

  # Which RDF term should be used to relate objects to an admin set?
  # If this is a new repository, you may want to set a custom predicate term here to
  # avoid clashes if you plan to use the default (dct:isPartOf) for other relations.
  # config.admin_set_predicate = ::RDF::DC.isPartOf

  # Email recipient of messages sent via the contact form
  # config.contact_email = "repo-admin@example.org"

  # Text prefacing the subject entered in the contact form
  # config.subject_prefix = "Contact form:"

  # How many notifications should be displayed on the dashboard
  # config.max_notifications_for_dashboard = 5

  # How frequently should a file be fixity checked
  # config.max_days_between_fixity_checks = 7

  # Options to control the file uploader
  # config.uploader = {
  #   limitConcurrentUploads: 6,
  #   maxNumberOfFiles: 100,
  #   maxFileSize: 500.megabytes
  # }

  # Enable displaying usage statistics in the UI
  # Defaults to false
  # Requires a Google Analytics id and OAuth2 keyfile.  See README for more info
  # config.analytics = false

  # Date you wish to start collecting Google Analytic statistics for
  # Leaving it blank will set the start date to when ever the file was uploaded by
  # NOTE: if you have always sent analytics to GA for downloads and page views leave this commented out
  # config.analytic_start_date = DateTime.new(2014, 9, 10)

  # Enables a link to the citations page for a work
  # Default is false
  # config.citations = false

  # Where to store tempfiles, leave blank for the system temp directory (e.g. /tmp)
  # config.temp_file_base = '/home/developer1'

  # Hostpath to be used in Endnote exports
  # config.persistent_hostpath = 'http://localhost/files/'

  # If you have ffmpeg installed and want to transcode audio and video set to true
  # config.enable_ffmpeg = false

  # Hyrax uses NOIDs for files and collections instead of Fedora UUIDs
  # where NOID = 10-character string and UUID = 32-character string w/ hyphens
  config.enable_noids = false

  # Template for your repository's NOID IDs
  # config.noid_template = "cpb-aacip_600-.reedeedeedk"

  # Use the database-backed minter class
  # config.noid_minter_class = ActiveFedora::Noid::Minter::Db

  # Store identifier minter's state in a file for later replayability
  # config.minter_statefile = '/tmp/minter-state'

  # Prefix for Redis keys
  # config.redis_namespace = "hyrax"

  # Path to the file characterization tool
  # config.fits_path = "fits.sh"

  # Path to the file derivatives creation tool
  # config.libreoffice_path = "soffice"

  # Option to enable/disable full text extraction from PDFs
  # Default is true, set to false to disable full text extraction
  # config.extract_full_text = true

  # How many seconds back from the current time that we should show by default of the user's activity on the user's dashboard
  # config.activity_to_show_default_seconds_since_now = 24*60*60

  # Hyrax can integrate with Zotero's Arkivo service for automatic deposit
  # of Zotero-managed research items.
  # config.arkivo_api = false

  # Stream realtime notifications to users in the browser
  # config.realtime_notifications = true

  # Location autocomplete uses geonames to search for named regions
  # Username for connecting to geonames
  # config.geonames_username = ''

  # Should the acceptance of the licence agreement be active (checkbox), or
  # implied when the save button is pressed? Set to true for active
  # The default is true.
  config.active_deposit_agreement_acceptance = false

  # Should work creation require file upload, or can a work be created first
  # and a file added at a later time?
  # The default is true.
  config.work_requires_files = false

  # Should a button with "Share my work" show on the front page to all users (even those not logged in)?
  # config.display_share_button_when_not_logged_in = true

  # The user who runs batch jobs. Update this if you aren't using emails
  # config.batch_user_key = 'batchuser@example.com'

  # The user who runs fixity check jobs. Update this if you aren't using emails
  # config.audit_user_key = 'audituser@example.com'
  #
  # The banner image. Should be 5000px wide by 1000px tall
  config.banner_image = '/aapb-pixels.png'

  # Temporary paths to hold uploads before they are ingested into FCrepo
  # These must be lambdas that return a Pathname. Can be configured separately
  #  config.upload_path = ->() { Rails.root + 'tmp' + 'uploads' }
  #  config.cache_path = ->() { Rails.root + 'tmp' + 'uploads' + 'cache' }

  # Location on local file system where derivatives will be stored
  # If you use a multi-server architecture, this MUST be a shared volume
  # config.derivatives_path = Rails.root.join('tmp', 'derivatives')

  # Should schema.org microdata be displayed?
  # config.display_microdata = true

  # What default microdata type should be used if a more appropriate
  # type can not be found in the locale file?
  # config.microdata_default_type = 'http://schema.org/CreativeWork'

  # Location on local file system where uploaded files will be staged
  # prior to being ingested into the repository or having derivatives generated.
  # If you use a multi-server architecture, this MUST be a shared volume.
  # config.working_path = Rails.root.join( 'tmp', 'uploads')

  # Should the media display partial render a download link?
  config.display_media_download_link = false

  # A configuration point for changing the behavior of the license service
  #   @see Hyrax::LicenseService for implementation details
  # config.license_service_class = Hyrax::LicenseService

  # Labels for display of permission levels
  # config.permission_levels = { "View/Download" => "read", "Edit access" => "edit" }

  # Labels for permission level options used in dropdown menus
  # config.permission_options = { "Choose Access" => "none", "View/Download" => "read", "Edit" => "edit" }

  # Labels for owner permission levels
  # config.owner_permission_levels = { "Edit Access" => "edit" }

  # Path to the ffmpeg tool
  # config.ffmpeg_path = 'ffmpeg'

  # Max length of FITS messages to display in UI
  # config.fits_message_length = 5

  # ActiveJob queue to handle ingest-like jobs
  # config.ingest_queue_name = :default

  ## Attributes for the lock manager which ensures a single process/thread is mutating a ore:Aggregation at once.
  # How many times to retry to acquire the lock before raising UnableToAcquireLockError
  # config.lock_retry_count = 600 # Up to 2 minutes of trying at intervals up to 200ms
  #
  # Maximum wait time in milliseconds before retrying. Wait time is a random value between 0 and retry_delay.
  # config.lock_retry_delay = 200
  #
  # How long to hold the lock in milliseconds
  # config.lock_time_to_live = 60_000

  ## Do not alter unless you understand how ActiveFedora handles URI/ID translation
  # begin Original Version - restore this once all old id records are moved
  # config.translate_id_to_uri = lambda do |id|
  #   uri = "#{ActiveFedora.fedora.host}#{ActiveFedora.fedora.base_path}/#{::Noid::Rails.treeify(id)}"
  #   return uri
  # end
  # end Original Version
  config.translate_id_to_uri = lambda do |id|
    return "#{ActiveFedora.fedora.host}#{ActiveFedora.fedora.base_path}/#{::Noid::Rails.treeify(id)}" unless id.match(/^cpb-aacip/)
    split_id = id.split('/')
    id = split_id[0]
    tail = split_id[1..-1].join('/')
    url = "#{ActiveFedora.fedora.host}#{ActiveFedora.fedora.base_path}/#{::Noid::Rails.treeify(id)}"
    begin
      ActiveFedora::Fedora.instance.connection.head(url)
    rescue Ldp::NotFound
      begin
        old_url = "#{ActiveFedora.fedora.host}#{ActiveFedora.fedora.base_path}/#{::Noid::Rails.treeify(id, false)}"
        ActiveFedora::Fedora.instance.connection.head(old_url)
      rescue Ldp::NotFound
        # Do nothing
      rescue Ldp::Gone
        # old id tombstone
        url = old_url
      else
        url = old_url
      end
    rescue Ldp::Gone
      # Do nothing, object was deleted
    end
    url += "/#{tail}" if tail.present?
    url
  end

  # config.translate_uri_to_id = ActiveFedora::Noid.config.translate_uri_to_id

  ## Fedora import/export tool
  #
  # Path to the Fedora import export tool jar file
  # config.import_export_jar_file_path = "tmp/fcrepo-import-export.jar"
  #
  # Location where BagIt files should be exported
  # config.bagit_dir = "tmp/descriptions"

  # Disable BrowseEverything, we're not using it atm.
  config.browse_everything = nil

  #Register custom Actor
  #
  Hyrax::CurationConcern.actor_factory.insert_after Hyrax::Actors::ApplyPermissionTemplateActor, Hyrax::Actors::EnforceParentTitle
  # Hyrax::CurationConcern.actor_factory.insert_after Hyrax::Actors::InitializeWorkflowActor, Hyrax::Actors::UpdateAssetDate


  ## Whitelist all directories which can be used to ingest from the local file
  # system.
  #
  # Any file, and only those, that is anywhere under one of the specified
  # directories can be used by CreateWithRemoteFilesActor to add local files
  # to works. Files uploaded by the user are handled separately and the
  # temporary directory for those need not be included here.
  #
  # Default value includes BrowseEverything.config['file_system'][:home] if it
  # is set, otherwise default is an empty list. You should only need to change
  # this if you have custom ingestions using CreateWithRemoteFilesActor to
  # ingest files from the file system that are not part of the BrowseEverything
  # mount point.
  #
  # config.whitelisted_ingest_dirs = []


  # Increase the number of Asset members that are displayed on the Asset's
  # #show page.
  config.show_work_item_rows = 100
end

Date::DATE_FORMATS[:standard] = "%m/%d/%Y"

Qa::Authorities::Local.register_subauthority('subjects', 'Qa::Authorities::Local::TableBasedAuthority')
Qa::Authorities::Local.register_subauthority('languages', 'Qa::Authorities::Local::TableBasedAuthority')
Qa::Authorities::Local.register_subauthority('genres', 'Qa::Authorities::Local::TableBasedAuthority')
ActiveFedora.init(solr_config_path: Rails.root.join('config', 'solr.yml'))

# set bulkrax default work type to first curation_concern if it isn't already set
if ENV['SETTINGS__BULKRAX__ENABLED'] == 'true'
  if Bulkrax.default_work_type.blank?
    Bulkrax.default_work_type = 'Asset'
  end
end
