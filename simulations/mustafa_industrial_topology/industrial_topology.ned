//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package simulations.mustafa_industrial_topology;

import inet.networks.base.TsnNetworkBase;
import inet.node.contract.IEthernetNetworkNode;
import inet.node.ethernet.Eth1G;
import inet.node.tsn.TsnClock;
import inet.node.tsn.TsnDevice;
import inet.node.tsn.TsnSwitch;

network industrial_topology extends TsnNetworkBase
{
    submodules:
        N1: TsnDevice {
            @display("p=300,400");
        }
        N2: TsnDevice {
            @display("p=500,500");
        }
        N3: TsnDevice {
            @display("p=500,300");
        }
        N4: TsnDevice {
            @display("p=600,300");
        }
        N5: TsnDevice {
            @display("p=700,500");
        }
        N6: TsnDevice {
            @display("p=900,500");
        }
        N7: TsnDevice {
            @display("p=800,300");
        }
        N8: TsnDevice {
            @display("p=1000,400");
        }
        SW1: TsnSwitch {
            @display("p=400,400");
        }
        SW2: TsnSwitch {
            @display("p=500,400");
        }
        SW3: TsnSwitch {
            @display("p=600,400");
        }
        SW4: TsnSwitch {
            @display("p=700,400");
        }
        SW5: TsnSwitch {
            @display("p=800,400");
        }
        SW6: TsnSwitch {
            @display("p=900,400");
        }

        MasterClock: TsnClock {
            @display("p=600,455");
        }


    connections:

        SW1.ethg++ <--> Eth1G <--> SW2.ethg++;
        SW2.ethg++ <--> Eth1G <--> SW3.ethg++;
        SW3.ethg++ <--> Eth1G <--> SW4.ethg++;
        SW4.ethg++ <--> Eth1G <--> SW5.ethg++;
        SW5.ethg++ <--> Eth1G <--> SW6.ethg++;
        N1.ethg++ <--> Eth1G <--> SW1.ethg++;
        N2.ethg++ <--> Eth1G <--> SW2.ethg++;
        N3.ethg++ <--> Eth1G <--> SW2.ethg++;
        N4.ethg++ <--> Eth1G <--> SW3.ethg++;
        N5.ethg++ <--> Eth1G <--> SW4.ethg++;
        N7.ethg++ <--> Eth1G <--> SW5.ethg++;
        N6.ethg++ <--> Eth1G <--> SW6.ethg++;
        N8.ethg++ <--> Eth1G <--> SW6.ethg++;

        MasterClock.ethg++ <--> Eth1G <--> SW3.ethg++;
}
