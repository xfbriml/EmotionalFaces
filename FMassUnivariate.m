%Using Mass Univariate Test analysis (MUT) and Factorial Mass Univariate
%Test analysis (FMUT)


%1) Creating GND variable from ERPLAB files.
    %Select your .erp files for each subject. Create a .GND file(/Scripts/EmoFacesERPS.GND)

    GND=erplab2GND('gui');

   
%1)a) Alternatevely load your already created .GND file

    load EFM_MU.GND -MAT
    load EmoFacesERPS125.GND -MAT

%2) Visualize the ERPs

    gui_erp(GND);
    
%3) See what's in your GND variable

    headinfo(GND);

    %3)a) Now would be a good time to to convert a GND variable from 250 Hz to 125 Hz using a FIR anti-aliasing 
         %filter and then re-baselining the data
  
    GND=decimateGND(GND,2,'fir',[-100 0]);
    
    %or 
    
    GND=decimateGND(GND,2);
    
    %to boxcar window

%4) Plot ERPs (positive up)

plot_wave(GND,[1 6],'ydir',[1]); %CR/Hits
plot_wave(GND,[1 5],'ydir',[1]); %CR/Fam
plot_wave(GND,[1 14],'ydir',[1]); %CR/Rec
plot_wave(GND,[5 14],'ydir',[1]); %Fam/Rec
plot_wave(GND,[3 4],'ydir',[1]); %FamFear/FamHappy
plot_wave(GND,[1 3 4],'ydir',[1]); %CR/FamFear/FamHappy
plot_wave(GND,[12 13],'ydir',[1]); %RecFear/RecHappy
plot_wave(GND,[1 12 13],'ydir',[1]); %CR/RecFear/RecHappy
plot_wave(GND,[7 8],'ydir',[1]); %HitsFear/HitsHappy
plot_wave(GND,[1 7 8],'ydir',[1]); %CR/HitsFear/HitsHappy
plot_wave(GND,[15 18],'ydir',[1]); %SME
plot_wave(GND,[16 17],'ydir',[1]); %SMHFear/SMHHappy
plot_wave(GND,[19 20],'ydir',[1]); %SMMFear/SMMHappy
plot_wave(GND,[16 18],'ydir',[1]); %SMEFear
plot_wave(GND,[17 18],'ydir',[1]); %SMEHappy


%5) Compute difference waves (if newly created GND)


GND=bin_dif(GND,1,6,'OldNew'); %bin21
GND=bin_dif(GND,1,5,'CRFam'); %bin22
GND=bin_dif(GND,1,14,'CRRec'); %bin23
GND=bin_dif(GND,5,14,'FamRec'); %bin24
GND=bin_dif(GND,3,4,'FFearFHappy'); %bin25
GND=bin_dif(GND,12,13,'RFearRHappy'); %bin26
GND=bin_dif(GND,7,8,'HitsFearHitsHappy'); %bin27
GND=bin_dif(GND,15,18,'SME'); %bin28
GND=bin_dif(GND,16,17,'SMHFearSMHHappy'); %bin29
GND=bin_dif(GND,19,20,'SMMFearSMMHappy'); %bin30
GND=bin_dif(GND,1,7,'CRFear'); %bin31
GND=bin_dif(GND,1,8,'CRHappy'); %bin32
GND=bin_dif(GND,16,18,'SMEFear'); %bin33
GND=bin_dif(GND,17,18,'SMEHappy');%bin34
GND=bin_dif(GND,1,12,'CRRecFear'); %bin35
GND=bin_dif(GND,1,13,'CRRecHappy'); %bin36
GND=bin_dif(GND,1,3,'CRFamFear'); %bin37
GND=bin_dif(GND,1,4,'CRFamHappy'); %bin38

%6) TestT

GND=tmaxGND(GND,21,'time_wind',[0 1100],'output_file','OldNew.txt');
GND=tmaxGND(GND,22,'time_wind',[100 900],'output_file','CRFam.txt');
GND=tmaxGND(GND,23,'time_wind',[100 900],'output_file','CRRec.txt');
GND=tmaxGND(GND,24,'time_wind',[100 900],'output_file','FamRec.txt');
GND=tmaxGND(GND,25,'time_wind',[100 900],'output_file','FFearFHappy.txt');
GND=tmaxGND(GND,26,'time_wind',[100 900],'output_file','RFearRHappy.txt');
GND=tmaxGND(GND,27,'time_wind',[100 900],'output_file','HitsFearHitsHappy.txt');
GND=tmaxGND(GND,28,'time_wind',[100 900],'output_file','SME.txt');
GND=tmaxGND(GND,29,'time_wind',[100 900],'output_file','SMHFearSMHHappy.txt');
GND=tmaxGND(GND,30,'time_wind',[100 900],'output_file','SMMFearSMMHappy.txt');
GND=tmaxGND(GND,31,'time_wind',[100 900],'output_file','CRFear.txt');
GND=tmaxGND(GND,32,'time_wind',[100 900],'output_file','CRHappy.txt');

%7) T tests with control of the false discovery rate

GND=tfdrGND(GND,21,'method', 'by', 'time_wind', [0 1100], 'output_file', 'OldNew.txt');

%8) Cluster 

GND=clustGND(GND,21,'time_wind',[0 1100],'chan_hood',.61,'thresh_p',.05);
GND=clustGND(GND,22,'time_wind',[0 1100],'chan_hood',.61,'thresh_p',.05);
GND=clustGND(GND,23,'time_wind',[0 1100],'chan_hood',.61,'thresh_p',.05);
GND=clustGND(GND,24,'time_wind',[0 1100],'chan_hood',.61,'thresh_p',.05);
GND=clustGND(GND,25,'time_wind',[0 1100],'chan_hood',.61,'thresh_p',.05);
GND=clustGND(GND,26,'time_wind',[0 1100],'chan_hood',.61,'thresh_p',.05);
GND=clustGND(GND,27,'time_wind',[0 1100],'chan_hood',.61,'thresh_p',.05);
GND=clustGND(GND,28,'time_wind',[0 1100],'chan_hood',.61,'thresh_p',.05);
GND=clustGND(GND,29,'time_wind',[0 1100],'chan_hood',.61,'thresh_p',.05);
GND=clustGND(GND,30,'time_wind',[0 1100],'chan_hood',.61,'thresh_p',.05);
GND=clustGND(GND,31,'time_wind',[0 1100],'chan_hood',.61,'thresh_p',.05);
GND=clustGND(GND,32,'time_wind',[0 1100],'chan_hood',.61,'thresh_p',.05);
GND=clustGND(GND,33,'time_wind',[0 1100],'chan_hood',.61,'thresh_p',.05);
GND=clustGND(GND,34,'time_wind',[0 1100],'chan_hood',.61,'thresh_p',.05);
GND=clustGND(GND,35,'time_wind',[0 1100],'chan_hood',.61,'thresh_p',.05);
GND=clustGND(GND,36,'time_wind',[0 1100],'chan_hood',.61,'thresh_p',.05);
GND=clustGND(GND,37,'time_wind',[0 1100],'chan_hood',.61,'thresh_p',.05);
GND=clustGND(GND,38,'time_wind',[0 1100],'chan_hood',.61,'thresh_p',.05);

%9)FMUT

GND = FclustGND(GND, 'bins', [1,6], 'factor_names', {'OldNew'},'factor_levels', [2], 'time_wind', [0, 1000], 'n_perm', 1e5,'chan_hood', 0.61, 'thresh_p', 0.05, 'alpha', 0.05);
GND = FclustGND(GND, 'bins', [1,5], 'factor_names', {'NoSourceNew'},'factor_levels', [2], 'time_wind', [0, 1000], 'n_perm', 1e5,'chan_hood', 0.61, 'thresh_p', 0.05, 'alpha', 0.05);
GND = FclustGND(GND, 'bins', [1,14], 'factor_names', {'SourceNew'},'factor_levels', [2], 'time_wind', [0, 1000], 'n_perm', 1e5,'chan_hood', 0.61, 'thresh_p', 0.05, 'alpha', 0.05);
GND = FclustGND(GND, 'bins', [5,14], 'factor_names', {'NoSourceSource'},'factor_levels', [2], 'time_wind', [0, 1000], 'n_perm', 1e5,'chan_hood', 0.61, 'thresh_p', 0.05, 'alpha', 0.05);
GND = FclustGND(GND, 'bins', [3,4], 'factor_names', {'NoSourceFearNoSourceHappy'},'factor_levels', [2], 'time_wind', [0, 1000], 'n_perm', 1e5,'chan_hood', 0.61, 'thresh_p', 0.05, 'alpha', 0.05);
GND = FclustGND(GND, 'bins', [12,13], 'factor_names', {'SourceFearSourceHappy'},'factor_levels', [2], 'time_wind', [0, 1000], 'n_perm', 1e5,'chan_hood', 0.61, 'thresh_p', 0.05, 'alpha', 0.05);
GND = FclustGND(GND, 'bins', [7,8], 'factor_names', {'HitsFearHitsHappy'},'factor_levels', [2], 'time_wind', [0, 1000], 'n_perm', 1e5,'chan_hood', 0.61, 'thresh_p', 0.05, 'alpha', 0.05);
GND = FclustGND(GND, 'bins', [15,18], 'factor_names', {'SME'},'factor_levels', [2], 'time_wind', [0, 1000], 'n_perm', 1e5,'chan_hood', 0.61, 'thresh_p', 0.05, 'alpha', 0.05);
GND = FclustGND(GND, 'bins', [16,17], 'factor_names', {'SubsequentHitFearSubsequent Hit Happy'},'factor_levels', [2], 'time_wind', [0, 1000], 'n_perm', 1e5,'chan_hood', 0.61, 'thresh_p', 0.05, 'alpha', 0.05);
GND = FclustGND(GND, 'bins', [19,20], 'factor_names', {'SubsequentMissFearSubsequentMissHappy'},'factor_levels', [2], 'time_wind', [0, 1000], 'n_perm', 1e5,'chan_hood', 0.61, 'thresh_p', 0.05, 'alpha', 0.05);
GND = FclustGND(GND, 'bins', [1,7], 'factor_names', {'HitsFearNew'},'factor_levels', [2], 'time_wind', [0, 1000], 'n_perm', 1e5,'chan_hood', 0.61, 'thresh_p', 0.05, 'alpha', 0.05);
GND = FclustGND(GND, 'bins', [1,8], 'factor_names', {'HitsHappy/New'},'factor_levels', [2], 'time_wind', [0, 1000], 'n_perm', 1e5,'chan_hood', 0.61, 'thresh_p', 0.05, 'alpha', 0.05);
GND = FclustGND(GND, 'bins', [17,18], 'factor_names', {'SMEHappy'},'factor_levels', [2], 'time_wind', [0, 1000], 'n_perm', 1e5,'chan_hood', 0.61, 'thresh_p', 0.05, 'alpha', 0.05);
GND = FclustGND(GND, 'bins', [1,12], 'factor_names', {'SourceFearNew'},'factor_levels', [2], 'time_wind', [0, 1000], 'n_perm', 1e5,'chan_hood', 0.61, 'thresh_p', 0.05, 'alpha', 0.05);
GND = FclustGND(GND, 'bins', [1,13], 'factor_names', {'SourceHappyNew'},'factor_levels', [2], 'time_wind', [0, 1000], 'n_perm', 1e5,'chan_hood', 0.61, 'thresh_p', 0.05, 'alpha', 0.05);
GND = FclustGND(GND, 'bins', [1,3], 'factor_names', {'NosourceFearNew'},'factor_levels', [2], 'time_wind', [0, 1000], 'n_perm', 1e3,'chan_hood', 0.61, 'thresh_p', 0.05, 'alpha', 0.05);
GND = FclustGND(GND, 'bins', [1,4], 'factor_names', {'NosourceHappyNew'},'factor_levels', [2], 'time_wind', [0, 1000], 'n_perm', 1e3,'chan_hood', 0.61, 'thresh_p', 0.05, 'alpha', 0.05);





gui_erp(GND,'bin',21);

GND=tmaxGND(GND,27,'time_wind',[100 900]);

GND = FclustGND(GND, ... 
                'bins', 1:6, ...  
                'factor_names', {'Frequency', 'Priming'}, ...  
                'factor_levels', [3, 2]);
GND = FmaxGND(GND, ... 
              'bins', 1:6, ... 
              'factor_names', {'memory'}, ...
              'factor_levels', [2,2], ... 
              'time_wind', [0, 1000], ...
        
              'n_perm', 1e5, ...
              'alpha', 0.05);