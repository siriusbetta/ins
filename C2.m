function out = C2(thetha)
thethaRad = rad(thetha);
%thethaRad = thetha;
R =[cos(thethaRad),0 , -sin(thethaRad);
    0,1,0
    sin(thethaRad),0,cos(thethaRad);
    ];
out = R;

end