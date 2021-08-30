basedir = '/Users/clinpsywoo/Dropbox/2011-yr/Teaching/R_stats/Stats2_2020Fall/data/study2';
original_dat_dir = fullfile(basedir, 'original_datafile');

load(fullfile(original_dat_dir, 'CRB_demographics.mat'));
load(fullfile(original_dat_dir, 'CRB_dataset_SCR_lpf5Hz_DS25Hz_011516.mat'));

participant_id = crb_demog.id';
participant_id = cat(1,participant_id{:});

clear sex;
sex_num = crb_demog.data(:,1);
for i = 1:numel(sex_num)
    if sex_num(i) == 2
        sex(i,1) = 'M';
    else
        sex(i,1) = 'F';
    end
end

age = crb_demog.data(:,2);
% 
% T = table(participant_id, sex, age);
% writetable(T, fullfile(basedir, 'demographics.csv'),'Delimiter','\t','QuoteStrings',true)

%% temp/ratings/reg data
subjects = [];
temperature = [];
ratings_intensity = [];
ratings_unpleasantness = [];
regulation = [];

for i = 1:numel(D.Event_Level.data)
    sub_data = D.Event_Level.data{i}(:,[11 12 13 16]);
    subjects = [subjects;repmat(i, size(sub_data,1),1)];
    temperature = [temperature;sub_data(:,1)];
    ratings_intensity = [ratings_intensity;sub_data(:,2)];
    ratings_unpleasantness = [ratings_unpleasantness;sub_data(:,3)];
    regulation = [regulation;sub_data(:,4)];
end

% T = table(subjects, temperature, ratings_intensity, ratings_unpleasantness, regulation);
% writetable(T, fullfile(basedir, 'temp_ratings_regulation_data.csv'),'Delimiter','\t','QuoteStrings',true)

% temperature = wani_33.curtemp(:)+32;
% ratings = wani_33.currep(:);
% regulation = wani_33.imaginecode(:);
% subjects = repmat(1:33, 97,1);
% subjects = subjects(:);

uu = unique(temperature);
avg_temp = NaN(max(subjects), numel(uu));

for i = 1:max(subjects)
    rat_temp = ratings_intensity(subjects==i);
    for j = 1:numel(uu)
        avg_temp(i,j) = mean(rat_temp(temperature(subjects==i)==uu(j)));
    end
end

heat_lv1 = avg_temp(:,1);
heat_lv2 = avg_temp(:,2);
heat_lv3 = avg_temp(:,3);
heat_lv4 = avg_temp(:,4);
heat_lv5 = avg_temp(:,5);
heat_lv6 = avg_temp(:,6);

% T = table(participant_id, sex, age, heat_lv1, heat_lv2, heat_lv3, heat_lv4, heat_lv5, heat_lv6);
% writetable(T, fullfile(basedir, 'demographics.csv'),'Delimiter','\t','QuoteStrings',true)

scr_datdir = '/Users/clinpsywoo/Dropbox/github/cognitive_regulation_physiology/data';
load(fullfile(scr_datdir, 'SCR_prediction_dat_112816.mat'));

for i = 1:41
    scr_lv1(i,1) = test_scr_int{1,2}(i);
    scr_lv2(i,1) = test_scr_int{2,2}(i);
    scr_lv3(i,1) = test_scr_int{3,2}(i);
    scr_lv4(i,1) = test_scr_int{4,2}(i);
    scr_lv5(i,1) = test_scr_int{5,2}(i);
    scr_lv6(i,1) = test_scr_int{6,2}(i);
end

% T = table(participant_id, sex, age, heat_lv1, heat_lv2, heat_lv3, heat_lv4, heat_lv5, heat_lv6, ...
%     scr_lv1, scr_lv2, scr_lv3, scr_lv4, scr_lv5, scr_lv6);
% writetable(T, fullfile(basedir, 'demographics_scr.csv'),'Delimiter','\t','QuoteStrings',true)

%%

scr_datdir = '/Users/clinpsywoo/Dropbox/github/cognitive_regulation_physiology/data';
load(fullfile(scr_datdir, 'SCR_prediction_dat_112816.mat'));

for i = 1:41
    scr_lv1_down(i,1) = test_scr_int{1,1}(i);
    scr_lv1_passive(i,1) = test_scr_int{1,2}(i);
    scr_lv1_up(i,1) = test_scr_int{1,3}(i);
    
    scr_lv2_down(i,1) = test_scr_int{2,1}(i);
    scr_lv2_passive(i,1) = test_scr_int{2,2}(i);
    scr_lv2_up(i,1) = test_scr_int{2,3}(i);
    
    scr_lv3_down(i,1) = test_scr_int{3,1}(i);
    scr_lv3_passive(i,1) = test_scr_int{3,2}(i);
    scr_lv3_up(i,1) = test_scr_int{3,3}(i);
    
    scr_lv4_down(i,1) = test_scr_int{4,1}(i);
    scr_lv4_passive(i,1) = test_scr_int{4,2}(i);
    scr_lv4_up(i,1) = test_scr_int{4,3}(i);
    
    scr_lv5_down(i,1) = test_scr_int{5,1}(i);
    scr_lv5_passive(i,1) = test_scr_int{5,2}(i);
    scr_lv5_up(i,1) = test_scr_int{5,3}(i);
    
    scr_lv6_down(i,1) = test_scr_int{6,1}(i);
    scr_lv6_passive(i,1) = test_scr_int{6,2}(i);
    scr_lv6_up(i,1) = test_scr_int{6,3}(i);
end


for i = 1:41
    unp_lv1_down(i,1) = dat_unp{1,1}(i);
    unp_lv1_passive(i,1) = dat_unp{1,2}(i);
    unp_lv1_up(i,1) = dat_unp{1,3}(i);
    
    unp_lv2_down(i,1) = dat_unp{2,1}(i);
    unp_lv2_passive(i,1) = dat_unp{2,2}(i);
    unp_lv2_up(i,1) = dat_unp{2,3}(i);
    
    unp_lv3_down(i,1) = dat_unp{3,1}(i);
    unp_lv3_passive(i,1) = dat_unp{3,2}(i);
    unp_lv3_up(i,1) = dat_unp{3,3}(i);
    
    unp_lv4_down(i,1) = dat_unp{4,1}(i);
    unp_lv4_passive(i,1) = dat_unp{4,2}(i);
    unp_lv4_up(i,1) = dat_unp{4,3}(i);
    
    unp_lv5_down(i,1) = dat_unp{5,1}(i);
    unp_lv5_passive(i,1) = dat_unp{5,2}(i);
    unp_lv5_up(i,1) = dat_unp{5,3}(i);
    
    unp_lv6_down(i,1) = dat_unp{6,1}(i);
    unp_lv6_passive(i,1) = dat_unp{6,2}(i);
    unp_lv6_up(i,1) = dat_unp{6,3}(i);
end

for i = 1:41
    int_lv1_down(i,1) = dat_int{1,1}(i);
    int_lv1_passive(i,1) = dat_int{1,2}(i);
    int_lv1_up(i,1) = dat_int{1,3}(i);
    
    int_lv2_down(i,1) = dat_int{2,1}(i);
    int_lv2_passive(i,1) = dat_int{2,2}(i);
    int_lv2_up(i,1) = dat_int{2,3}(i);
    
    int_lv3_down(i,1) = dat_int{3,1}(i);
    int_lv3_passive(i,1) = dat_int{3,2}(i);
    int_lv3_up(i,1) = dat_int{3,3}(i);
    
    int_lv4_down(i,1) = dat_int{4,1}(i);
    int_lv4_passive(i,1) = dat_int{4,2}(i);
    int_lv4_up(i,1) = dat_int{4,3}(i);
    
    int_lv5_down(i,1) = dat_int{5,1}(i);
    int_lv5_passive(i,1) = dat_int{5,2}(i);
    int_lv5_up(i,1) = dat_int{5,3}(i);
    
    int_lv6_down(i,1) = dat_int{6,1}(i);
    int_lv6_passive(i,1) = dat_int{6,2}(i);
    int_lv6_up(i,1) = dat_int{6,3}(i);
end


T = table(participant_id, sex, age, ...
    int_lv1_down, int_lv1_passive, int_lv1_up, int_lv2_down, int_lv2_passive, int_lv2_up, int_lv3_down, int_lv3_passive, int_lv3_up, ...
    int_lv4_down, int_lv4_passive, int_lv4_up, int_lv5_down, int_lv5_passive, int_lv5_up, int_lv6_down, int_lv6_passive, int_lv6_up, ...
    unp_lv1_down, unp_lv1_passive, unp_lv1_up, unp_lv2_down, unp_lv2_passive, unp_lv2_up, unp_lv3_down, unp_lv3_passive, unp_lv3_up, ...
    unp_lv4_down, unp_lv4_passive, unp_lv4_up, unp_lv5_down, unp_lv5_passive, unp_lv5_up, unp_lv6_down, unp_lv6_passive, unp_lv6_up, ...
    scr_lv1_down, scr_lv1_passive, scr_lv1_up, scr_lv2_down, scr_lv2_passive, scr_lv2_up, scr_lv3_down, scr_lv3_passive, scr_lv3_up, ...
    scr_lv4_down, scr_lv4_passive, scr_lv4_up, scr_lv5_down, scr_lv5_passive, scr_lv5_up, scr_lv6_down, scr_lv6_passive, scr_lv6_up);
writetable(T, fullfile(basedir, 'demographics_anova.csv'),'Delimiter','\t','QuoteStrings',true)

