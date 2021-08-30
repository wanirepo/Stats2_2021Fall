basedir = '/Users/clinpsywoo/Dropbox/2011-yr/Teaching/R_stats/Stats2_2020Fall/data/study1';
original_dat_dir = fullfile(basedir, 'original_datafile');
load(fullfile(original_dat_dir, 'wani_33_variables.mat'));

temperature = wani_33.curtemp(:)+32;
ratings = wani_33.currep(:);
regulation = wani_33.imaginecode(:);
subjects = repmat(1:33, 97,1);
subjects = subjects(:);

% T = table(subjects, temperature, ratings, regulation);
% writetable(T, fullfile(basedir, 'temp_ratings_regulation_data.csv'),'Delimiter','\t','QuoteStrings',true)

%%

u = unique(wani_33.curtemp);

% [(1:size(u,1))' u]
% 
% ans =
% 
%     1.0000   42.8000
%     2.0000   44.1000
%     3.0000   44.3000
%     4.0000   45.3000
%     5.0000   45.4000
%     6.0000   46.0000
%     7.0000   46.3000
%     8.0000   46.7000
%     9.0000   47.0000
%    10.0000   47.3000
%    11.0000   48.0000
%    12.0000   48.3000
%    13.0000   49.3000

curtemp = NaN(size(wani_33.curtemp));

curtemp(wani_33.curtemp == u(1) | wani_33.curtemp == u(2) | wani_33.curtemp == u(3)) = 44.3;

curtemp(wani_33.curtemp == u(4) | wani_33.curtemp == u(5)) = 45.3;

curtemp(wani_33.curtemp == u(6) | wani_33.curtemp == u(7) | wani_33.curtemp == u(8)) = 46.3;

curtemp(wani_33.curtemp == u(9) | wani_33.curtemp == u(10)) = 47.3;

curtemp(wani_33.curtemp == u(11) | wani_33.curtemp == u(12)) = 48.3;

curtemp(wani_33.curtemp == u(13)) = 49.3;


% T = table(subjects, curtemp(:), ratings, regulation);
% writetable(T, fullfile(basedir, 'temp_ratings_regulation_data.csv'),'Delimiter','\t','QuoteStrings',true)

%% 

basedir = '/Users/clinpsywoo/Dropbox/2011-yr/Teaching/R_stats/Stats2_2020Fall/data/study1';
original_dat_dir = fullfile(basedir, 'original_datafile');
load(fullfile(original_dat_dir, 'roi_new_variables.mat'));

for i = 1:numel(roi_new.pexp)
    nps_lv1(i,1) = nanmean(roi_new.pexp{i}(roi_new.curtemp{i}<13));
    nps_lv2(i,1) = nanmean(roi_new.pexp{i}(roi_new.curtemp{i}>=13 & roi_new.curtemp{i}<14));
    nps_lv3(i,1) = nanmean(roi_new.pexp{i}(roi_new.curtemp{i}>=14 & roi_new.curtemp{i}<15));
    nps_lv4(i,1) = nanmean(roi_new.pexp{i}(roi_new.curtemp{i}>=15 & roi_new.curtemp{i}<16));
    nps_lv5(i,1) = nanmean(roi_new.pexp{i}(roi_new.curtemp{i}>=16 & roi_new.curtemp{i}<17));
    nps_lv6(i,1) = nanmean(roi_new.pexp{i}(roi_new.curtemp{i}>=17));
end

nps_lv6(isnan(nps_lv6)) = nanmean(nps_lv6);

%%
dat_demo = importdata(fullfile(original_dat_dir, 'demographics.tsv'));
participant_id = dat_demo.textdata(2:end,1);
sex = dat_demo.textdata(2:end,2);
age = dat_demo.data;

uu = unique(curtemp);
avg_temp = NaN(max(subjects), 6);

for i = 1:max(subjects)
    rat_temp = ratings(subjects==i);
    for j = 1:6
        avg_temp(i,j) = mean(rat_temp(curtemp(subjects==i)==uu(j)));
    end
end

heat_lv1 = avg_temp(:,1);
heat_lv2 = avg_temp(:,2);
heat_lv3 = avg_temp(:,3);
heat_lv4 = avg_temp(:,4);
heat_lv5 = avg_temp(:,5);
heat_lv6 = avg_temp(:,6);

% T = table(participant_id, sex, age, heat_lv1, heat_lv2, heat_lv3, heat_lv4, heat_lv5, heat_lv6, nps_lv1, nps_lv2, nps_lv3, nps_lv4, nps_lv5, nps_lv6);
% writetable(T, fullfile(basedir, 'demographics_nps.csv'),'Delimiter','\t','QuoteStrings',true)

%%

for i = 1:numel(roi_new.pexp)
    
    nps_low_down(i,1) = nanmean(roi_new.pexp{i}(roi_new.curtemp{i}<14 & roi_new.imagine{i}==-1));
    nps_low_passive(i,1) = nanmean(roi_new.pexp{i}(roi_new.curtemp{i}<14 & roi_new.imagine{i}==0));
    nps_low_up(i,1) = nanmean(roi_new.pexp{i}(roi_new.curtemp{i}<14 & roi_new.imagine{i}==1));
    
    nps_med_down(i,1) = nanmean(roi_new.pexp{i}(roi_new.curtemp{i}>=14 & roi_new.curtemp{i}<16 & roi_new.imagine{i}==-1));
    nps_med_passive(i,1) = nanmean(roi_new.pexp{i}(roi_new.curtemp{i}>=14 & roi_new.curtemp{i}<16 & roi_new.imagine{i}==0));
    nps_med_up(i,1) = nanmean(roi_new.pexp{i}(roi_new.curtemp{i}>=14 & roi_new.curtemp{i}<16 & roi_new.imagine{i}==1));
    
    nps_high_down(i,1) = nanmean(roi_new.pexp{i}(roi_new.curtemp{i}>=16 & roi_new.imagine{i}==-1));
    nps_high_passive(i,1) = nanmean(roi_new.pexp{i}(roi_new.curtemp{i}>=16 & roi_new.imagine{i}==0));
    nps_high_up(i,1) = nanmean(roi_new.pexp{i}(roi_new.curtemp{i}>=16 & roi_new.imagine{i}==1));
end

nps_high_down(isnan(nps_high_down)) = nanmean(nps_high_down);
nps_high_up(isnan(nps_high_up)) = nanmean(nps_high_up);



for i = 1:numel(roi_new.pexp)
    
    rating_low_down(i,1) = nanmean(roi_new.currep{i}(roi_new.curtemp{i}<14 & roi_new.imagine{i}==-1));
    rating_low_passive(i,1) = nanmean(roi_new.currep{i}(roi_new.curtemp{i}<14 & roi_new.imagine{i}==0));
    rating_low_up(i,1) = nanmean(roi_new.currep{i}(roi_new.curtemp{i}<14 & roi_new.imagine{i}==1));
    
    rating_med_down(i,1) = nanmean(roi_new.currep{i}(roi_new.curtemp{i}>=14 & roi_new.curtemp{i}<16 & roi_new.imagine{i}==-1));
    rating_med_passive(i,1) = nanmean(roi_new.currep{i}(roi_new.curtemp{i}>=14 & roi_new.curtemp{i}<16 & roi_new.imagine{i}==0));
    rating_med_up(i,1) = nanmean(roi_new.currep{i}(roi_new.curtemp{i}>=14 & roi_new.curtemp{i}<16 & roi_new.imagine{i}==1));
    
    rating_high_down(i,1) = nanmean(roi_new.currep{i}(roi_new.curtemp{i}>=16 & roi_new.imagine{i}==-1));
    rating_high_passive(i,1) = nanmean(roi_new.currep{i}(roi_new.curtemp{i}>=16 & roi_new.imagine{i}==0));
    rating_high_up(i,1) = nanmean(roi_new.currep{i}(roi_new.curtemp{i}>=16 & roi_new.imagine{i}==1));
end

rating_high_down(isnan(rating_high_down)) = nanmean(rating_high_down);
rating_high_up(isnan(rating_high_up)) = nanmean(rating_high_up);

T = table(participant_id, sex, age, rating_low_down, rating_low_passive, rating_low_up, rating_med_down, rating_med_passive, rating_med_up, rating_high_down, rating_high_passive, rating_high_up, nps_low_down, nps_low_passive, nps_low_up, nps_med_down, nps_med_passive, nps_med_up, nps_high_down, nps_high_passive, nps_high_up);
writetable(T, fullfile(basedir, 'demographics_anova.csv'),'Delimiter','\t','QuoteStrings',true)
