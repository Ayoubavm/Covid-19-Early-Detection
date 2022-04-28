%% Load data
hr = readtable("A0L9BM2_hr.csv");
st=readtable("A0L9BM2_steps.csv");
%% Create data time depends
TT=timetable(hr.datetime,hr.heartrate);
% Calculate the mean value of hearte rate each minute
HROS = retime(TT,"minutely","mean");
% Prepare hearterate and steps variables (depends on data size)

Hr=HROS.Var1;
stps=st.steps;

si=min(size(stps),size(Hr))

% Calculate the HROS
for i=1:1:si(1);
hros(i)=Hr(i)/(stps(i)+1);
end
% associate timedate to HROS values (the one from heart-rate per min)
A0L9BM2_hros=timetable(HROS.Time(1:si(1)), hros');
% Create the csv file
writetimetable(A0L9BM2_hros, 'A0L9BM2_hros.csv');