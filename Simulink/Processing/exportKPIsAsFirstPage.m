
function exportKPIsAsFirstPage(Results, baseline, kpi_map, scenarioNames, selectedWell, controllerName, outFile, th)
    fig = figure('Visible','off','Color',th.fig_bg);
    ax  = axes('Parent',fig,'Position',[0 0 1 1],'Visible','off');
    ax.XLim = [0 1]; ax.YLim = [0 1];

    y = 0.95; lineSpacing = 0.02; blockSpacing = 0.04;

    text(0.05, y, 'Key Performance Indicators','FontWeight','bold','FontSize',16,'Color',th.text_col,'Parent',ax,'Units','normalized');
    y = y - blockSpacing;

    text(0.05, y, sprintf('Controller: %s', strrep(controllerName, '_', '\_')),'FontSize',11,'Color',th.lineColors(1,:),'Parent',ax,'Units','normalized'); y = y - lineSpacing;
    text(0.05, y, sprintf('Baseline  : PI OBLTR'),'FontSize',11,'Color',th.lineColors(2,:),'Parent',ax,'Units','normalized'); y = y - lineSpacing;
    text(0.05, y, sprintf('Test well : %s', strrep(selectedWell, '_', '\_')),'FontSize',11,'Color',th.text_col,'Parent',ax,'Units','normalized'); y = y - blockSpacing;

    for k = 1:numel(Results)
        scenarioName = scenarioNames{Results(k).Scenario};
    
        % --- Collect only numeric scalar KPIs ---
        KPIFields = fieldnames(Results(k).KPI);
        KPIFieldsScalar = {};  % only numeric scalar fields
        KPIData = [];
    
        for f = 1:numel(KPIFields)
            val = Results(k).KPI.(KPIFields{f});
            if isnumeric(val) && isscalar(val)
                KPIData(end+1) = val;
                KPIFieldsScalar{end+1} = KPIFields{f};
            end
        end
    
        % --- Scenario title ---
        scenTitle = sprintf('#%d %s', k, scenarioName);
        text(0.05, y, scenTitle, 'FontWeight','bold','FontSize',12,'Color',th.text_col,'Parent',ax,'Units','normalized');
        y = y - lineSpacing;
    
        % --- Controller KPIs ---
        controllerLine = sprintf('%-12s','Controller:');
        for f = 1:numel(KPIData)
            if isKey(kpi_map, KPIFieldsScalar{f})
                kDisp = kpi_map(KPIFieldsScalar{f});
            else
                kDisp = KPIFieldsScalar{f};
            end
            controllerLine = [controllerLine sprintf(' %s: %.4g |', kDisp, KPIData(f))];
        end
        text(0.05, y, controllerLine,'FontSize',10,'Color',th.lineColors(1,:),'Parent',ax,'Units','normalized');
        y = y - lineSpacing;
    
        % --- Baseline KPIs ---
        baselineLine = sprintf('%-11s','Baseline:');
        for f = 1:numel(KPIData)
            if isKey(kpi_map, KPIFieldsScalar{f})
                kDisp = kpi_map(KPIFieldsScalar{f});
            else
                kDisp = KPIFieldsScalar{f};
            end
            baselineLine = [baselineLine sprintf(' %s: %.4g |', kDisp, KPIData(f))];
        end
        text(0.05, y, baselineLine,'FontSize',10,'Color',th.lineColors(2,:),'Parent',ax,'Units','normalized');
        y = y - blockSpacing;
    end

    exportgraphics(fig,outFile,'ContentType','vector');
    close(fig);
end
