Feature: IP Authority

        Scenario Outline: Check the permission of a connection by IP
                Given the IP "<ip>" is allowed
                When a connection with the IP "192.168.1.1" is established
                Then the result should be "<result>"

                Examples:
                        | ip          | result     |
                        | 192.168.1.1 | allowed    |
                        | 192.168.2.1 | not allowd |
                
        Scenario Outline: Check the permission of a connection by subnet
                Given the net "<net>" is allowed
                When a connection with the IP "192.168.1.1" is established
                Then the result should be "<result>"

                Examples:
                        | net            | result      |
                        | 192.168.1.0/24 | allowed     |
                        | 192.168.2.0/24 | not allowed |

        Scenario Outline: Check the permission of a connection by range
                Given the range from "<low>" to "<high>" is allowed
                When a connection with the IP "192.168.1.1" is established
                Then the result should be "<result>"

                Examples:
                        | low         | high         | result      |
                        | 192.168.1.1 | 192.168.1.10 | allowed     |
                        | 192.168.1.2 | 192.168.1.10 | not allowed |
