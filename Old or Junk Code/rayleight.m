%Just plots an angular histyogram of fluorescence spikes

%Note: We need to run both angles_HD and spike_finder before running this

lim_spike=4; %minimum number of signmificant spikes to consider neuron for hitogram plot


for i=1:size(xloc,1) %change according to how many neurons you want to analyse
    var_toplot=[];
    for j=1:size(xloc,2)
        temp=round(xloc(i,j)*30);
        if temp==0
            break
        else
            temp1=head_dir(temp);
            var_toplot=[var_toplot, temp1]; %#ok<AGROW>
        end
    end
        if j-1>lim_spike
            figure
            polarhistogram(var_toplot.*(2*pi()/360),18)
            title(['Neuron No.= ' num2str(i) ', No. Significant Spikes= ' num2str(j-1)])
        end
end
