clc; clear; close
%{
####################################################################
    This code includes Flight Stability and Control First Homework 
script, belonging to Atakan Öztürk, 110180026
####################################################################
%}
% Import Data (a)
root_path = 'datcom_data';
student_id = 110180026;
folder_num = string(mod(student_id,10));
path = strcat(root_path,'/',folder_num,'/','datcom.out');
rawdata = datcomimport(path);
data = cell2mat(rawdata);

% Data Handling
% data.beta = 0; % No sideslip is applied as assumed in homework file
data.nbeta = 1; % Length of Sideslip Angle Polar
data.mass = 1340; % Mass, kg
data.inertia_yy = 8134; % Moment of Inertia for Pitching, kg/m^2
% data.omega = 0; % No rotation at trim

% Call Simproject, keep it open
open('LongitudinalTrim.slx');
sim('LongitudinalTrim.slx');

% Plotting Aerodynamic Moment Coefficient
         %{
cmplot(data);
function cmplot(data)
figure;
hold on;
plot(data.alpha, data.cm); % Data
plot(data.alpha, zeros(1,data.nalpha)); % Trim Line
xlabel('\alpha (^o)','FontSize',10);
ylabel('Aerodynamic Moment Coefficient','FontSize',10);
xlim([min(data.alpha) max(data.alpha)]);
ylim([min(data.cm) max(data.cm)]);
hold off;
end
         %}