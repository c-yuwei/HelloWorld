distribution_name = 'Hello, World!';
distribution_moniker = 'helloworld';
pipeline_folders = {
    'helloworld', ...
    'hellouniverse' ...
    };
braph2_version = 'heads/ywc-genesis-function';
rollcall = { ...
    '+util', '+_Exporter.gen.m', '+_Importer.gen.m', ...
    '+ds*', '-ds_examples', ...
    '-analysis', ...
    '+atlas*', '-_ExporterBrainAtlasTXT.gen.m', '-_ExporterBrainAtlasXLS.gen.m', '-_ImporterBrainAtlasTXT.gen.m', ...
    '+gt*', ...
    '-cohort', ...
    '-nn', ...
    '+gui*', '-_PanelPropCell.gen.m', '-_PanelPropClassList.gen.m', '-_PanelPropRVectorSmart.gen.m', '-_PanelPropStringList.gen.m', ...
    '+brainsurfs', ...
    '+atlases', ...
    '-graphs', ...
    '-measures', ...
    '-neuralnetworks', ...
    '+pipelines', ...
        '+helloworld*', '+hellouniverse*', ...
    '+test*', ...
    '-sandbox' ...
    };
files_to_delete = { ...
    };