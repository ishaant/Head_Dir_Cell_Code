
%Note: We need to run both angles_HD and spike_finder before running this

lim_spike=4; %minimum number of signmificant spikes to consider neuron for hitogram plot


for i=1:size(xloc,1) %change according to how many neurons you want to analyse
    var_toplotx=[];
    var_toploty=[];
    for j=1:size(xloc,2)
        tempx=round(xloc(i,j)*30);
        tempy=yloc(i,j);
        if tempx==0
            break
        else
            temp1=head_dir(tempx);
            var_toplotx=[var_toplotx, temp1]; %#ok<AGROW>
            var_toploty=[var_toploty, tempy]; %#ok<AGROW> %
        end
    end
        if j-1>lim_spike
            
%            WindRose(var_toplotx,var_toploty,'cMap','cool')
                        
%             figure
%             polarhistogram(var_toplotx.*(2*pi()/360),12)

            
            [var_toplotx, a_order] = sort(var_toplotx);
            var_toploty=var_toploty(a_order);
            
%             figure
%             polarplot((2*pi()/360).*var_toplotx([1:end 1]),var_toploty([1:end 1]),'-o')
              
            figure
            polarscatter(var_toplotx.*(2*pi()/360),var_toploty,'filled')
            rlim([0 1])
            
            title(['Neuron No.= ' num2str(i) ', No. Significant Spikes= ' num2str(j-1)])
        end
end
hold off
