require "ipaddr"

class IPAuthority
        def initialize
                @allowed_ip = Array.new
                @allowed_net = Array.new
                @allowed_range = Array.new

                @denied_ip = Array.new
                @denied_net = Array.new
                @denied_range = Array.new
        end

        def add_allowed_ip(ip)
                @allowed_ip.push(ip)
        end
        def has_allowed_ip(ip)
                return @allowed_ip.include?(ip)
        end

        def add_allowed_net(net)
                @allowed_net.push(net)
        end

        def get_allowed_net(net)
                return @allowed_net.include?(net)
        end

        def add_allowed_range(range)
                @allowed_range.push(range)
        end
        def get_allowed_range(range)
                return @allowed_range.include?(range)
        end

        def add_denied_ip(ip)
                @denied_ip.push(ip)
        end
        def has_denied_ip(ip)
                return @denied_ip.include?(ip)
        end

        def add_denied_net(net)
                @denied_net.push(net)
        end

        def get_denied_net(net)
                return @denied_net.include?(net)
        end

        def add_denied_range(range)
                @denied_range.push(range)
        end
        def get_denied_range(range)
                return @denied_range.include?(range)
        end

        def is_granted(ip)
                return false if @denied_ip.include?(ip)
                @denied_net.each do |net|
                        return false if net.include?(ip)
                end
                @denied_range.each do |range|
                        return false if (range["low"] .. range["high"]) === ip
                end
                
                return true if @allowed_ip.include?(ip)
                @allowed_net.each do |net|
                        return true if net.include?(ip)
                end
                @allowed_range.each do |range|
                        return true if (range["low"] .. range["high"]) === ip
                end

                return false
        end
end
