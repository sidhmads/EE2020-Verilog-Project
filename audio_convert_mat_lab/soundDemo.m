%6.111 Wave File to COE demonstration
%Yuta Kuboyama yuta@mit.edu
%4/10/2008

%% How to use this file
%Notice how %% divides up sections?  If you hit ctrl+enter, then MATLAB 
%will execute all the lines within that section, but nothing else.  You can
%also navigate quickly through the file using ctrl+arrow_key

%% Load a sound
%this shows you how to load a wav file, play it, and look at it.  Note that
%this only works for uncompressed wavs.  Also, note that the wav file below
%is mono, and so it returns a large column vector.  If the file were
%stereo, it would return a large matrix with two columns, one for the left
%and one for the right.
input = audioread('5.wav');     %Loads the given wave file
sound(input);                    %Plays the given wave file
plot(input);                     %Draws the given wave file

%% Make it into a .coe file
%to make it into a coe file, we need to convert the data from what MATLAB
%uses to what the DAC uses.  MATLAB is storing the data as a float 
%from -1 to 1.  The DAC takes twos complement integers, whose size will
%depend on how good you want your sound to be vs how much space you want to
%use

%so first we extract only the part of the data that we want by looking at
%the wave file's plot.  I'll take from the beginning to 10,000
% data_in = input(1:8192); % two columns for the stereo
data_in = input(1:6400,1);
%data_in = input(:,1);

%% choose the range to scale
%depending on how many bits you want to use
% bits = 12;
% scaled_data = data_in.*(2^(bits-1))-1;  %scale the floats appropriately (it's two's complement)
% rounded_data = round(scaled_data);  %rounds them down
% 
% %make the data 2's complement
% for i = 1:length(rounded_data)
%     if(rounded_data(i)>=0)
%         data(i) = rounded_data(i);
%     else
%         data(i) = ((2^bits)-abs(rounded_data(i)));  %2's compliment
%     end
% end
data = zeros(1,length(data_in));
for i=1:length(data_in)
    tmp=(data_in(i)-min(data_in))/(max(data_in)-min(data_in));
    data(i)=tmp*4095;
end
%%
%convert to binary
% data_bin = dec2bin(data,bits);
data_bin = round(data);

%open a file
output_name = '5.coe';
file = fopen(output_name,'w');

%write the header info
fprintf(file,'memory_initialization_radix=10;\n');
fprintf(file,'memory_initialization_vector=\n');
fclose(file);

%put commas in the data
rowxcolumn = size(data_bin);
rows = rowxcolumn(2);
columns = rowxcolumn(1);
output = data_bin';
% for i = 1:(rows-1)
%     output(i,(columns+1)) = '';
% end
% output(rows,(columns+1)) = ';';

%append the numeric values to the file
dlmwrite(output_name,output,'-append','delimiter','', 'newline', 'pc');

%You're done!

