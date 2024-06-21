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

package tsn_simulations.simulations.mustafa_car_network;

import inet.networks.base.TsnNetworkBase;
import inet.node.contract.IEthernetNetworkNode;
import inet.node.ethernet.EthernetLink;

network car_network extends TsnNetworkBase
{
	parameters:
        *.eth[*].bitrate = default(1Gbps);
    submodules:
        Switch1: <default("TsnSwitch")> like IEthernetNetworkNode {
            @display("p=530,274;i=device/switch");
        }
        Switch2: <default("TsnSwitch")> like IEthernetNetworkNode {
            @display("p=625,278;i=device/switch");
        }

        DA_Cam: <default("TsnDevice")> like IEthernetNetworkNode {
            @display("p=472,331");
        }

        HU: <default("TsnDevice")> like IEthernetNetworkNode {
            @display("p=426,233");
        }

        Cam1: <default("TsnDevice")> like IEthernetNetworkNode {
            @display("p=361,279");
        }

        Cam2: <default("TsnDevice")> like IEthernetNetworkNode {
            @display("p=520,410");
        }

        Cam3: <default("TsnDevice")> like IEthernetNetworkNode {
            @display("p=459,140");
        }

        Cam4: <default("TsnDevice")> like IEthernetNetworkNode {
            @display("p=809,275");
        }

        RSE: <default("TsnDevice")> like IEthernetNetworkNode {
            @display("p=611,202");
        }

        Telemetrics: <default("TsnDevice")> like IEthernetNetworkNode {
            @display("p=611,350");
        }

        CD_DVD: <default("TsnDevice")> like IEthernetNetworkNode {
            @display("p=717,179");
        }

        CU: <default("TsnDevice")> like IEthernetNetworkNode {
            @display("p=717,363");
        }

    connections:
        Switch1.ethg++ <--> EthernetLink <--> Switch2.ethg++;

        DA_Cam.ethg++ <--> EthernetLink <--> Switch1.ethg++;
        HU.ethg++ <--> EthernetLink <--> Switch1.ethg++;
        Cam1.ethg++ <--> EthernetLink <--> Switch1.ethg++;
        Cam2.ethg++ <--> EthernetLink <--> Switch1.ethg++;
        Cam3.ethg++ <--> EthernetLink <--> Switch1.ethg++;   

        Cam4.ethg++ <--> EthernetLink <--> Switch2.ethg++;
        RSE.ethg++ <--> EthernetLink <--> Switch2.ethg++;
        Telemetrics.ethg++ <--> EthernetLink <--> Switch2.ethg++;
        CD_DVD.ethg++ <--> EthernetLink <--> Switch2.ethg++;
        CU.ethg++ <--> EthernetLink <--> Switch2.ethg++;
}     
