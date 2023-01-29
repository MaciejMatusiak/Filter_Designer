classdef Filter_Designer < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                      matlab.ui.Figure
        GridLayout                    matlab.ui.container.GridLayout
        LeftPanel                     matlab.ui.container.Panel
        SIGNALANALYSISbyMATLABLabel   matlab.ui.control.Label
        FILTERORDERSDropDown          matlab.ui.control.DropDown
        FILTERORDERSDropDownLabel     matlab.ui.control.Label
        TYPEOFFUNCTIONDropDown        matlab.ui.control.DropDown
        TYPEOFFUNCTIONDropDownLabel   matlab.ui.control.Label
        STARTButton                   matlab.ui.control.Button
        TYPEOFFILTERDropDown          matlab.ui.control.DropDown
        TYPEOFFILTERDropDownLabel     matlab.ui.control.Label
        CenterPanel                   matlab.ui.container.Panel
        GridLayout2                   matlab.ui.container.GridLayout
        Label                         matlab.ui.control.Label
        UIAxes3                       matlab.ui.control.UIAxes
        RightPanel                    matlab.ui.container.Panel
        GridLayout3                   matlab.ui.container.GridLayout
        CreatedbyMaciejMatusiakLabel  matlab.ui.control.Label
        UIAxes2                       matlab.ui.control.UIAxes
    end

    % Properties that correspond to apps with auto-reflow
    properties (Access = private)
        onePanelWidth = 576;
        twoPanelWidth = 768;
    end



    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: STARTButton
        function ButtonPushed(app, ~)
            type = app.TYPEOFFILTERDropDown.Value;
            num_ord = app.FILTERORDERSDropDown.Value;
            c_fun = app.TYPEOFFUNCTIONDropDown.Value;
 
            N  = 2000;  Fp = 1000;  y=0;
            F1 = 100;   F2 = 250;   F3 = 400;
            t  = 0:1/Fp:(N-1)/Fp;   
            x1 = sin(2*pi*F1*t);
            x2 = sin(2*pi*F2*t);
            x3 = sin(2*pi*F3*t);
            x = x1+x2+x3;

            f=linspace(0,1,floor(numel(x)/2));
            X = abs(fft(x))/numel(x);
            X = X(1:floor(end/2));
            X(2:end-1) = 2*X(2:end-1);

            switch type
                case '1'
                    w=200/(Fp/2);
                    switch c_fun
                        case '1'
                            switch num_ord
                                case '10'
                                    b=fir1(10,w,'low');
                                    [h,w]=freqz(b,1,512,2);
                                    y=filter(b,1,x);
                                case '20'
                                    b=fir1(20,w,'low');
                                    [h,w]=freqz(b,1,512,2);
                                    y=filter(b,1,x);
                                case '30'
                                    b=fir1(30,w,'low');
                                    [h,w]=freqz(b,1,512,2);
                                    y=filter(b,1,x);
                                case '0'
                                return
                            end
                        case '2'
                            switch num_ord
                                case '10'
                                    [b,a] = butter(10,w,'low');
                                    [h,w]=freqz(b,a,512,2);
                                    y=filter(b,a,x);
                                case '20'
                                    [b,a] = butter(20,w,'low');
                                    [h,w]=freqz(b,a,512,2);
                                    y=filter(b,a,x);
                                case '30'
                                    [b,a] = butter(30,w,'low');
                                    [h,w]=freqz(b,a,512,2);
                                    y=filter(b,a,x);
                                case '0'
                                return
                            end
                    end
                case '2'
                    w=300/ (Fp/2);
                        switch c_fun
                            case '1'
                                switch num_ord
                                    case '10'
                                        b=fir1(10,w,'high');
                                        [h,w]=freqz(b,1,512,2);
                                        y=filter(b,1,x);
                                    case '20'
                                        b=fir1(20,w,'high');
                                        [h,w]=freqz(b,1,512,2);
                                        y=filter(b,1,x);
                                    case '30'
                                        b=fir1(30,w,'high');
                                        [h,w]=freqz(b,1,512,2);
                                        y=filter(b,1,x);
                                    case '0'
                                    return
                                end
                            case '2'
                                switch num_ord
                                    case '10'
                                        [b,a] = butter(10,w,'high');
                                        [h,w]=freqz(b,a,512,2);
                                        y=filter(b,a,x);
                                    case '20'
                                        [b,a] = butter(20,w,'high');
                                        [h,w]=freqz(b,a,512,2);
                                        y=filter(b,a,x);
                                    case '30'
                                        [b,a] = butter(30,w,'high');
                                        [h,w]=freqz(b,a,512,2);
                                        y=filter(b,a,x);
                                    case '0'
                                    return
                                end
                        end
                case '3'
                    w=[200/(Fp/2) 300/(Fp/2)];
                        switch c_fun
                            case '1'
                                switch num_ord
                                    case '10'
                                        b=fir1(10,w,'bandpass');
                                        [h,w]=freqz(b,1,512,2);
                                        y=filter(b,1,x);
                                    case '20'
                                        b=fir1(20,w,'bandpass');
                                        [h,w]=freqz(b,1,512,2);
                                        y=filter(b,1,x);
                                    case '30'
                                        b=fir1(30,w,'bandpass');
                                        [h,w]=freqz(b,1,512,2);
                                        y=filter(b,1,x);
                                    case '0'
                                    return
                                end
                            case '2'
                                switch num_ord
                                    case '10'
                                        [b,a] = butter(10,w,'high');
                                        [h,w]=freqz(b,a,512,2);
                                        y=filter(b,a,x);
                                    case '20'
                                        [b,a] = butter(20,w,'high');
                                        [h,w]=freqz(b,a,512,2);
                                        y=filter(b,a,x);
                                    case '30'
                                        [b,a] = butter(30,w,'high');
                                        [h,w]=freqz(b,a,512,2);
                                        y=filter(b,a,x);
                                    case '0'
                                    return
                                end
                        end
                case '4'
                    w=[200/(Fp/2) 300/(Fp/2)];
                        switch c_fun
                            case '1'
                                switch num_ord
                                    case '10'
                                        b=fir1(10,w,'stop');
                                        [h,w]=freqz(b,1,512,2);
                                        y=filter(b,1,x);
                                    case '20'
                                        b=fir1(20,w,'stop');
                                        [h,w]=freqz(b,1,512,2);
                                        y=filter(b,1,x);
                                    case '30'
                                        b=fir1(30,w,'stop');
                                        [h,w]=freqz(b,1,512,2);
                                        y=filter(b,1,x);
                                    case '0'
                                    return
                                end
                            case '2'
                                switch num_ord
                                    case '10'
                                        [b,a] = butter(10,w,'high');
                                        [h,w]=freqz(b,a,512,2);
                                        y=filter(b,a,x);
                                    case '20'
                                        [b,a] = butter(20,w,'high');
                                        [h,w]=freqz(b,a,512,2);
                                        y=filter(b,a,x);
                                    case '30'
                                        [b,a] = butter(30,w,'high');
                                        [h,w]=freqz(b,a,512,2);
                                        y=filter(b,a,x);
                                    case '0'
                                    return
                                end
                            case '0'
                            return
                        end
                case '0'
                return
            end    
            
            mY=abs(fft(y))/numel(x);
            mY = mY(1:floor(end/2));
            mY(2:end-1) = 2*mY(2:end-1);
            
            plot(app.UIAxes3,w,abs(h),'r',f,X,'b')
            title(app.UIAxes3,'LOWPASS-FILTER AND SIGNAL')
            legend(app.UIAxes3,'Filter amplitude characteristics','Frequency spectrum of signal');
            xlabel(app.UIAxes3,'Normalized Frequency','FontSize',10)
            ylabel(app.UIAxes3,'Amplitude','FontSize',10)
            app.UIAxes3.XLim = [0 1];
            app.UIAxes3.YLim = [0 1.2];
            
            plot(app.UIAxes2,f,mY,'b')
            title(app.UIAxes2,'FILTRED SIGNAL')
            legend(app.UIAxes2,'Frequency spectrum of signal after filtration');
            xlabel(app.UIAxes2,'Normalized Frequency','FontSize',10)
            ylabel(app.UIAxes2,'Amplitude','FontSize',10)
            app.UIAxes2.XLim = [0 1];
            app.UIAxes2.YLim = [0 1.2];
        end

        % Changes arrangement of the app based on UIFigure width
        function updateAppLayout(app, ~)
            currentFigureWidth = app.UIFigure.Position(3);
            if(currentFigureWidth <= app.onePanelWidth)
                % Change to a 3x1 grid
                app.GridLayout.RowHeight = {445, 445, 445};
                app.GridLayout.ColumnWidth = {'1x'};
                app.CenterPanel.Layout.Row = 1;
                app.CenterPanel.Layout.Column = 1;
                app.LeftPanel.Layout.Row = 2;
                app.LeftPanel.Layout.Column = 1;
                app.RightPanel.Layout.Row = 3;
                app.RightPanel.Layout.Column = 1;
            elseif (currentFigureWidth > app.onePanelWidth && currentFigureWidth <= app.twoPanelWidth)
                % Change to a 2x2 grid
                app.GridLayout.RowHeight = {445, 445};
                app.GridLayout.ColumnWidth = {'1x', '1x'};
                app.CenterPanel.Layout.Row = 1;
                app.CenterPanel.Layout.Column = [1,2];
                app.LeftPanel.Layout.Row = 2;
                app.LeftPanel.Layout.Column = 1;
                app.RightPanel.Layout.Row = 2;
                app.RightPanel.Layout.Column = 2;
            else
                % Change to a 1x3 grid
                app.GridLayout.RowHeight = {'1x'};
                app.GridLayout.ColumnWidth = {165, '1x', 380};
                app.LeftPanel.Layout.Row = 1;
                app.LeftPanel.Layout.Column = 1;
                app.CenterPanel.Layout.Row = 1;
                app.CenterPanel.Layout.Column = 2;
                app.RightPanel.Layout.Row = 1;
                app.RightPanel.Layout.Column = 3;
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.AutoResizeChildren = 'off';
            app.UIFigure.Position = [100 100 923 445];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.SizeChangedFcn = createCallbackFcn(app, @updateAppLayout, true);

            % Create GridLayout
            app.GridLayout = uigridlayout(app.UIFigure);
            app.GridLayout.ColumnWidth = {165, '1x', 380};
            app.GridLayout.RowHeight = {'1x'};
            app.GridLayout.ColumnSpacing = 0;
            app.GridLayout.RowSpacing = 0;
            app.GridLayout.Padding = [0 0 0 0];
            app.GridLayout.Scrollable = 'on';

            % Create LeftPanel
            app.LeftPanel = uipanel(app.GridLayout);
            app.LeftPanel.TitlePosition = 'centertop';
            app.LeftPanel.BackgroundColor = [0.902 0.902 0.902];
            app.LeftPanel.Layout.Row = 1;
            app.LeftPanel.Layout.Column = 1;

            % Create TYPEOFFILTERDropDownLabel
            app.TYPEOFFILTERDropDownLabel = uilabel(app.LeftPanel);
            app.TYPEOFFILTERDropDownLabel.HorizontalAlignment = 'center';
            app.TYPEOFFILTERDropDownLabel.FontWeight = 'bold';
            app.TYPEOFFILTERDropDownLabel.Position = [25 304 115 22];
            app.TYPEOFFILTERDropDownLabel.Text = 'TYPE OF FILTER';

            % Create TYPEOFFILTERDropDown
            app.TYPEOFFILTERDropDown = uidropdown(app.LeftPanel);
            app.TYPEOFFILTERDropDown.Items = {'DEFAULT', 'LOW-PASS', 'HIGH-PASS', 'BAND-PASS', 'BAND-STOP'};
            app.TYPEOFFILTERDropDown.ItemsData = {'0', '1', '2', '3', '4'};
            app.TYPEOFFILTERDropDown.FontWeight = 'bold';
            app.TYPEOFFILTERDropDown.BackgroundColor = [0.8 0.8 0.8];
            app.TYPEOFFILTERDropDown.Position = [22 275 121 22];
            app.TYPEOFFILTERDropDown.Value = '0';

            % Create STARTButton
            app.STARTButton = uibutton(app.LeftPanel, 'push');
            app.STARTButton.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.STARTButton.IconAlignment = 'center';
            app.STARTButton.BackgroundColor = [0.8 0.8 0.8];
            app.STARTButton.FontSize = 18;
            app.STARTButton.FontWeight = 'bold';
            app.STARTButton.Position = [17 20 127 39];
            app.STARTButton.Text = 'START';

            % Create TYPEOFFUNCTIONDropDownLabel
            app.TYPEOFFUNCTIONDropDownLabel = uilabel(app.LeftPanel);
            app.TYPEOFFUNCTIONDropDownLabel.HorizontalAlignment = 'center';
            app.TYPEOFFUNCTIONDropDownLabel.FontWeight = 'bold';
            app.TYPEOFFUNCTIONDropDownLabel.Position = [22 226 122 22];
            app.TYPEOFFUNCTIONDropDownLabel.Text = 'TYPE OF FUNCTION';

            % Create TYPEOFFUNCTIONDropDown
            app.TYPEOFFUNCTIONDropDown = uidropdown(app.LeftPanel);
            app.TYPEOFFUNCTIONDropDown.Items = {'DEFAULT', 'FIR1', 'BUTTER'};
            app.TYPEOFFUNCTIONDropDown.ItemsData = {'0', '1', '2'};
            app.TYPEOFFUNCTIONDropDown.FontWeight = 'bold';
            app.TYPEOFFUNCTIONDropDown.BackgroundColor = [0.8 0.8 0.8];
            app.TYPEOFFUNCTIONDropDown.Position = [22 197 122 22];
            app.TYPEOFFUNCTIONDropDown.Value = '0';

            % Create FILTERORDERSDropDownLabel
            app.FILTERORDERSDropDownLabel = uilabel(app.LeftPanel);
            app.FILTERORDERSDropDownLabel.HorizontalAlignment = 'center';
            app.FILTERORDERSDropDownLabel.FontWeight = 'bold';
            app.FILTERORDERSDropDownLabel.Position = [30 138 101 22];
            app.FILTERORDERSDropDownLabel.Text = 'FILTER ORDERS';

            % Create FILTERORDERSDropDown
            app.FILTERORDERSDropDown = uidropdown(app.LeftPanel);
            app.FILTERORDERSDropDown.Items = {'DEFAULT', '10', '20', '30'};
            app.FILTERORDERSDropDown.ItemsData = {'0', '10', '20', '30'};
            app.FILTERORDERSDropDown.FontWeight = 'bold';
            app.FILTERORDERSDropDown.BackgroundColor = [0.8 0.8 0.8];
            app.FILTERORDERSDropDown.Position = [20 109 122 22];
            app.FILTERORDERSDropDown.Value = '0';

            % Create SIGNALANALYSISbyMATLABLabel
            app.SIGNALANALYSISbyMATLABLabel = uilabel(app.LeftPanel);
            app.SIGNALANALYSISbyMATLABLabel.HorizontalAlignment = 'center';
            app.SIGNALANALYSISbyMATLABLabel.FontSize = 16;
            app.SIGNALANALYSISbyMATLABLabel.FontWeight = 'bold';
            app.SIGNALANALYSISbyMATLABLabel.FontColor = [0.502 0.502 0.502];
            app.SIGNALANALYSISbyMATLABLabel.Position = [5 355 157 72];
            app.SIGNALANALYSISbyMATLABLabel.Text = {'SIGNAL ANALYSIS'; 'by MATLAB'};

            % Create CenterPanel
            app.CenterPanel = uipanel(app.GridLayout);
            app.CenterPanel.TitlePosition = 'centertop';
            app.CenterPanel.Layout.Row = 1;
            app.CenterPanel.Layout.Column = 2;

            % Create GridLayout2
            app.GridLayout2 = uigridlayout(app.CenterPanel);
            app.GridLayout2.ColumnWidth = {'1x'};
            app.GridLayout2.RowHeight = {'1.08x', '8.81x', '1x'};
            app.GridLayout2.Padding = [2.5 10 2.5 10];

            % Create UIAxes3
            app.UIAxes3 = uiaxes(app.GridLayout2);
            title(app.UIAxes3, 'Title')
            xlabel(app.UIAxes3, 'X')
            ylabel(app.UIAxes3, 'Y')
            zlabel(app.UIAxes3, 'Z')
            app.UIAxes3.XGrid = 'on';
            app.UIAxes3.YGrid = 'on';
            app.UIAxes3.Layout.Row = 2;
            app.UIAxes3.Layout.Column = 1;

            % Create Label
            app.Label = uilabel(app.GridLayout2);
            app.Label.VerticalAlignment = 'bottom';
            app.Label.FontSize = 10;
            app.Label.FontWeight = 'bold';
            app.Label.Layout.Row = 3;
            app.Label.Layout.Column = 1;
            app.Label.Text = '';

            % Create RightPanel
            app.RightPanel = uipanel(app.GridLayout);
            app.RightPanel.Layout.Row = 1;
            app.RightPanel.Layout.Column = 3;

            % Create GridLayout3
            app.GridLayout3 = uigridlayout(app.RightPanel);
            app.GridLayout3.ColumnWidth = {'1x'};
            app.GridLayout3.RowHeight = {'1.08x', '8.81x', '1x'};
            app.GridLayout3.Padding = [2.5 10 2.5 10];

            % Create UIAxes2
            app.UIAxes2 = uiaxes(app.GridLayout3);
            title(app.UIAxes2, 'Title')
            xlabel(app.UIAxes2, 'X')
            ylabel(app.UIAxes2, 'Y')
            zlabel(app.UIAxes2, 'Z')
            app.UIAxes2.XGrid = 'on';
            app.UIAxes2.YGrid = 'on';
            app.UIAxes2.Layout.Row = 2;
            app.UIAxes2.Layout.Column = 1;

            % Create CreatedbyMaciejMatusiakLabel
            app.CreatedbyMaciejMatusiakLabel = uilabel(app.GridLayout3);
            app.CreatedbyMaciejMatusiakLabel.HorizontalAlignment = 'right';
            app.CreatedbyMaciejMatusiakLabel.VerticalAlignment = 'bottom';
            app.CreatedbyMaciejMatusiakLabel.Layout.Row = 3;
            app.CreatedbyMaciejMatusiakLabel.Layout.Column = 1;
            app.CreatedbyMaciejMatusiakLabel.Text = 'Created by Maciej Matusiak  ';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Filter_Designer

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end