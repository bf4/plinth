# load the libraries
require 'aws'
# # log requests using the default rails logger
# AWS.config(:logger => Rails.logger)
# # load credentials from a file
# config_path = File.expand_path(File.dirname(__FILE__) + "/../aws.yml")
# AWS.config(YAML.load(File.read(config_path)))
# @TODO need to grab the auth details from a config file
AWS.config :access_key_id => 'AKIAIO5KEUTO3IPMRXHA', :secret_access_key => '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'

def aws_ec2_role(which, *args, &block)
  options = args.last.is_a?(Hash) ? args.pop : {}
  
  ec2 = AWS::EC2.new
  # optionally switch to a non-default region
  if region = options[:region]
    region = ec2.regions[region]
    unless region.exists?
      raise "Requested region '#{region.name}' does not exist.  Valid regions: \n #{ec2.regions.map(&:name).join("\n  ")}"
    end
    # a region acts like the main EC2 interface
    ec2 = region
  end
  
  query = {}
  
  instances = AWS.memoize do
    query = {}
    # Filter by tags
    if tags = options[:tags]      
      args.delete :tags
      ec2.instances.select do |i|
        r = false
        tags.each do |key, value|
          if value
            r = i.tags.to_h[key.to_s] == value
          else
           r = i.tags.to_h.has_key? key.to_s
         end
        end
        r
      end
    end
  end
  # @TODO we need to make sure we merge the dns names with the other args
  args = instances.map {|i| i.dns_name}
  role which, *args
end