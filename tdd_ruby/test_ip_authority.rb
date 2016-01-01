require_relative "ip_authority"
require "ipaddr"
require "test/unit"

class TestIPAuthority < Test::Unit::TestCase

        def setup
                @auth = IPAuthority.new
        end

        def teardown
                ## do nothing
        end

        def test_add_allowed_ip
                ip = IPAddr.new("192.168.1.1")
                @auth.add_allowed_ip(ip)
                assert(@auth.has_allowed_ip(ip))
        end

        def test_add_allowed_net
                net = IPAddr.new("192.168.1.0/24")
                @auth.add_allowed_net(net)
                assert( @auth.get_allowed_net(net))
        end

        def test_add_allowed_range
                range = {
                        "low"   => IPAddr.new("192.168.1.100"),
                        "high"  => IPAddr.new("192.168.1.150")
                }
                @auth.add_allowed_range(range)
                assert(@auth.get_allowed_range(range))
        end

        def test_add_denied_ip
                ip = IPAddr.new("192.168.1.1")
                @auth.add_denied_ip(ip)
                assert(@auth.has_denied_ip(ip))
        end

        def test_add_denied_net
                net = IPAddr.new("192.168.1.0/24")
                @auth.add_denied_net(net)
                assert( @auth.get_denied_net(net))
        end

        def test_add_denied_range
                range = {
                        "low"   => IPAddr.new("192.168.1.100"),
                        "high"  => IPAddr.new("192.168.1.150")
                }
                @auth.add_denied_range(range)
                assert(@auth.get_denied_range(range))
        end

        def test_allowed_ip
                allowed_ip = IPAddr.new("192.168.1.1")
                ip = IPAddr.new("192.168.1.1")
                @auth.add_allowed_ip(allowed_ip)
                assert(@auth.is_granted(ip) == true)
        end

        def test_not_allowed_ip
                allowed_ip = IPAddr.new("192.168.1.1")
                ip = IPAddr.new("192.168.1.2")
                @auth.add_allowed_ip(allowed_ip)
                assert(@auth.is_granted(ip) == false)
        end

        def test_allowed_net
                allowed_net = IPAddr.new("192.168.1.0/24")
                ip = IPAddr.new("192.168.1.1")
                @auth.add_allowed_net(allowed_net)
                assert(@auth.is_granted(ip) == true)
        end

        def test_not_allowed_net
                allowed_net = IPAddr.new("192.168.1.0/24")
                ip = IPAddr.new("192.168.2.1")
                @auth.add_allowed_net(allowed_net)
                assert(@auth.is_granted(ip) == false)
        end

        def test_allowed_range
                allowed_range = {
                        "low"   => IPAddr.new("192.168.1.100"),
                        "high"  => IPAddr.new("192.168.1.200")
                }
                ip = IPAddr.new("192.168.1.150")
                @auth.add_allowed_range(allowed_range)
                assert(@auth.is_granted(ip) == true)
        end

        def test_not_allowed_range
                allowed_range = {
                        "low"   => IPAddr.new("192.168.1.100"),
                        "high"  => IPAddr.new("192.168.1.200")
                }
                ip = IPAddr.new("192.168.1.250")
                @auth.add_allowed_range(allowed_range)
                assert(@auth.is_granted(ip) == false)
        end

        def test_allowed_any
                allowed_net = IPAddr.new("0.0.0.0/0")
                ip = IPAddr.new("192.168.1.1")
                @auth.add_allowed_net(allowed_net)
                assert(@auth.is_granted(ip) == true)
        end
                
        def test_denied_any
                denied_net = IPAddr.new("0.0.0.0/0")
                ip = IPAddr.new("192.168.1.1")
                @auth.add_denied_net(denied_net)
                assert(@auth.is_granted(ip) == false)
        end

        def test_deined_ip
                allowed_net = IPAddr.new("0.0.0.0/0")
                denied_ip = IPAddr.new("192.168.1.1")
                ip = IPAddr.new("192.168.1.1")
                @auth.add_allowed_net(allowed_net)
                @auth.add_denied_ip(denied_ip)
                assert(@auth.is_granted(ip) == false)
        end

        def test_deined_net
                allowed_net = IPAddr.new("0.0.0.0/0")
                denied_net = IPAddr.new("192.168.1.0/24")
                ip = IPAddr.new("192.168.1.1")
                @auth.add_allowed_net(allowed_net)
                @auth.add_denied_net(denied_net)
                assert(@auth.is_granted(ip) == false)
        end

        def test_deined_net
                allowed_net = IPAddr.new("0.0.0.0/0")
                denied_range = {
                        "low"   => IPAddr.new("192.168.1.100"),
                        "high"  => IPAddr.new("192.168.1.200")
                }
                ip = IPAddr.new("192.168.1.150")
                @auth.add_allowed_net(allowed_net)
                @auth.add_denied_range(denied_range)
                assert(@auth.is_granted(ip) == false)
        end
end
