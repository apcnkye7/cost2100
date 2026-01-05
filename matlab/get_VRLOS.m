function VRLOS = get_VRLOS(BS, paraEx, paraSt)
%GET_VRLOS Generate the LOS VR for each BS
%
%Default call: 
%VRLOS = get_VRLOS(BS, paraEx, paraSt)
%------
%Input:
%------
%BS: BS information
% .pos: BS position
%paraEx: External parameters
%paraSt: Stochastic parameters
%------
%Output:
%------
%VRLOS: LOS VR position, VR([x y])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This file is a part of the COST2100 channel model.
%
%This program, the COST2100 channel model, is free software: you can 
%redistribute it and/or modify it under the terms of the GNU General Public 
%License as published by the Free Software Foundation, either version 3 of 
%the License, or (at your option) any later version.
%
%This program is distributed in the hope that it will be useful, but 
%WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
%or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License 
%for more details.
%
%If you use it for scientific purposes, please consider citing it in line 
%with the description in the Readme-file, where you also can find the 
%contributors.
%
%You should have received a copy of the GNU General Public License along 
%with this program. If not, see <http://www.gnu.org/licenses/>.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%d_co: distance scale beyond which correlation decays or beyond which certain components vanish
%r_l:likely a "LOS region radius" or minimum distance offset(to avoid placing VRLOS too close to the BS)
x = rand*(paraSt.d_co-paraSt.r_l);
y = rand*(paraSt.d_co-paraSt.r_l);
%rejects samples outside a circle
while (sqrt(x^2+y^2)>paraSt.d_co)
    x = rand*(paraSt.d_co-paraSt.r_l);
    y = rand*(paraSt.d_co-paraSt.r_l);
end

VRLOS = [x+BS.pos(1) y+BS.pos(2)];
