distribution_name = 'Hello, World!';
distribution_moniker = 'helloworld';
pipeline_folders = {
    'helloworld', ...
    'hellouniverse' ...
    };
braph2_version = 'heads/ywc-lite-genesis';

% Add here all included and excluded folders and elements
% '-folder'                 the folder and its elements will be excluded
%
% '+folder'                 the folder is included, but not its elements
%   '+_ElementName.gen.m'   the element is included,
%                           if the folder is included
%
% '+folder*'                the folder and its elements are included
%   '-_ElementName.gen.m'   the element is excluded,
%                           if the folder and its elements are included
% (by default, the folders are included as '+folder*')
rollcall = { ...
    '+util', '+_Exporter.gen.m', '+_Importer.gen.m', ...
    '+ds*', '-ds_examples', ...
    '-analysis', ...
    '-atlas', ...
    '-gt', ...
    '-cohort', ...
    '-nn', ...
    '+gui', '+_ExporterPipelineBRAPH2.gen.m', '+_GUI.gen.m', '+_GUIElement.gen.m', ...
        '+_GUIFig.gen.m', '+_GUILayout.gen.m', '+_ImporterPipelineBRAPH2.gen.m', ...
        '+_Panel.gen.m', '+_PanelElement.gen.m', '+_PanelFig.gen.m', '+_PanelProp.gen.m', ...
        '+_PanelPropItem.gen.m', '+_PanelPropString.gen.m', '+_Pipeline.gen.m', '+_PipelineCode.gen.m', ...
        '+_PipelinePP_Notes.gen.m', '+_PipelinePP_PSDict.gen.m', '+_PipelineSection.gen.m', ...
        '+_PanelPropStringTextArea.gen.m', ...
    '-brainsurfs', ...
    '-atlases', ...
    '-graphs', ...
    '-measures', ...
    '-neuralnetworks', ...
    '+pipelines', ...
        '+helloworld*', '+hellouniverse*', ...
    '+test*', ...
    '-sandbox' ...
    };
files_to_delete = { ...
    ['src' filesep 'gui' filesep 'test_GUIFig.m'], ...
    ['src' filesep 'gui' filesep 'test_PanelFig.m'], ...
    };