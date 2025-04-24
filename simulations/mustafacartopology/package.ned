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

package simulations.mustafacartopology;

import inet.networks.base.TsnNetworkBase;
import inet.node.ethernet.Eth1G;
import inet.node.tsn.TsnDevice;
import inet.node.tsn.TsnSwitch;

network topology extends TsnNetworkBase
{
    submodules:
        Cam1: TsnDevice {
            @display("p=300,400");
        }
        Cam2: TsnDevice {
            @display("p=400,650");
        }
        DaCam: TsnDevice {
            @display("p=400,300");
        }
        HU: TsnDevice {
            @display("p=400,500");
        }
        Cam3: TsnDevice {
            @display("p=400,150");
        }
        SW1: TsnSwitch {
            @display("p=550,400");
        }
        SW2: TsnSwitch {
            @display("p=800,400");
        }
        RSE: TsnDevice {
            @display("p=650,300");
        }
        Telematics: TsnDevice {
            @display("p=650,500");
        }
        CU: TsnDevice {
            @display("p=850,550");
        }
        CdAudioDVD: TsnDevice {
            @display("p=850,250");
        }
        Cam4: TsnDevice {
            @display("p=1050,400");
        }

    connections:
        Cam1.ethg++ <--> Eth1G <--> SW1.ethg++;
        HU.ethg++ <--> Eth1G <--> SW1.ethg++;
        DaCam.ethg++ <--> Eth1G <--> SW1.ethg++;
        Cam2.ethg++ <--> Eth1G <--> SW1.ethg++;
        Cam3.ethg++ <--> Eth1G <--> SW1.ethg++;
        SW1.ethg++ <--> Eth1G <--> SW2.ethg++;
        RSE.ethg++ <--> Eth1G <--> SW2.ethg++;
        Telematics.ethg++ <--> Eth1G <--> SW2.ethg++;
        CU.ethg++ <--> Eth1G <--> SW2.ethg++;
        CdAudioDVD.ethg++ <--> Eth1G <--> SW2.ethg++;
        Cam4.ethg++ <--> Eth1G <--> SW2.ethg++;
}
