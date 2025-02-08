classdef BrainSurfacePF < PanelFig
	%BrainSurfacePF is a panel figure that manages the plot of a brain surfce.
	% It is a subclass of <a href="matlab:help PanelFig">PanelFig</a>.
	%
	% A Panel Figure for Brain Surface (BrainSurfacePF) manages the plot of the 
	%  brain surface choosen by the user. 
	% BrainSurfacePF provides the common methods needed to manage the plot of 
	%  the surface. In particular, the user can change lighting, material, 
	%  camlight, shadning, colormap, facecolor, brain color, face color, 
	%  edge color, and background color. 
	% A collection of brain surfaces in NV format can be found in the folder 
	%  ./braph2/brainsurfs/.
	%
	% The list of BrainSurfacePF properties is:
	%  <strong>1</strong> <strong>ELCLASS</strong> 	ELCLASS (constant, string) is the class of the panel figure for brain surface.
	%  <strong>2</strong> <strong>NAME</strong> 	NAME (constant, string) is the name of the panel figure for brain surface.
	%  <strong>3</strong> <strong>DESCRIPTION</strong> 	DESCRIPTION (constant, string) is the description of the panel figure for brain surface.
	%  <strong>4</strong> <strong>TEMPLATE</strong> 	TEMPLATE (parameter, item) is the template of the panel figure for brain surface.
	%  <strong>5</strong> <strong>ID</strong> 	ID (data, string) is a few-letter code for the panel figure for brain surface.
	%  <strong>6</strong> <strong>LABEL</strong> 	LABEL (metadata, string) is an extended label of the panel figure for brain surface.
	%  <strong>7</strong> <strong>NOTES</strong> 	NOTES (metadata, string) are some specific notes about the panel figure for brain surface.
	%  <strong>8</strong> <strong>TOSTRING</strong> 	TOSTRING (query, string) returns a string that represents the concrete element.
	%  <strong>9</strong> <strong>WAITBAR</strong> 	WAITBAR (gui, logical) detemines whether to show the waitbar.
	%  <strong>10</strong> <strong>H_WAITBAR</strong> 	H_WAITBAR (evanescent, handle) is the waitbar handle.
	%  <strong>11</strong> <strong>DRAW</strong> 	DRAW (query, logical) draws the figure brain surface.
	%  <strong>12</strong> <strong>DRAWN</strong> 	DRAWN (query, logical) returns whether the panel has been drawn.
	%  <strong>13</strong> <strong>PARENT</strong> 	PARENT (gui, item) is the panel parent.
	%  <strong>14</strong> <strong>BKGCOLOR</strong> 	BKGCOLOR (figure, color) is the panel background color.
	%  <strong>15</strong> <strong>H</strong> 	H (evanescent, handle) is the panel handle.
	%  <strong>16</strong> <strong>SHOW</strong> 	SHOW (query, logical) shows the figure containing the panel.
	%  <strong>17</strong> <strong>HIDE</strong> 	HIDE (query, logical) hides the figure containing the panel.
	%  <strong>18</strong> <strong>DELETE</strong> 	DELETE (query, logical) resets the handles when the panel figure for brain surface is deleted.
	%  <strong>19</strong> <strong>CLOSE</strong> 	CLOSE (query, logical) closes the figure containing the panel.
	%  <strong>20</strong> <strong>ST_POSITION</strong> 	ST_POSITION (figure, item) determines the panel position.
	%  <strong>21</strong> <strong>H_TOOLBAR</strong> 	H_TOOLBAR (evanescent, handle) returns the handle of the toolbar.
	%  <strong>22</strong> <strong>H_TOOLS</strong> 	H_TOOLS (evanescent, handlelist) is the list of panel-specific tools from the panel figure for brain surface.
	%  <strong>23</strong> <strong>H_AXES</strong> 	H_AXES (evanescent, handle) is the handle for the axes.
	%  <strong>24</strong> <strong>VIEW</strong> 	VIEW (figure, rvector) sets the desired view as the line-of-sight azimuth and elevation angles.
	%  <strong>25</strong> <strong>ST_AXIS</strong> 	ST_AXIS (figure, item) determines the axis settings.
	%  <strong>26</strong> <strong>LISTENER_ST_AXIS</strong> 	LISTENER_ST_AXIS (evanescent, handle) contains the listener to the axis settings to update the pushbuttons.
	%  <strong>27</strong> <strong>SURFFILE</strong> 	SURFFILE (figure, option) is the name of the file of the brain surface to be plotted.
	%  <strong>28</strong> <strong>SURF</strong> 	SURF (metadata, item) is the brain surface to be plotted.
	%  <strong>29</strong> <strong>H_BRAIN</strong> 	H_BRAIN (evanescent, handle) is the handle for brain surface.
	%  <strong>30</strong> <strong>BRAIN</strong> 	BRAIN (figure, logical) determines whether the brain surface is shown.
	%  <strong>31</strong> <strong>ST_SURFACE</strong> 	ST_SURFACE (figure, item) determines the surface settings.
	%  <strong>32</strong> <strong>ST_AMBIENT</strong> 	ST_AMBIENT (figure, item) determines the ambient settings.
	%
	% BrainSurfacePF methods (constructor):
	%  BrainSurfacePF - constructor
	%
	% BrainSurfacePF methods:
	%  set - sets values of a property
	%  check - checks the values of all properties
	%  getr - returns the raw value of a property
	%  get - returns the value of a property
	%  memorize - returns the value of a property and memorizes it
	%             (for RESULT, QUERY, and EVANESCENT properties)
	%  getPropSeed - returns the seed of a property
	%  isLocked - returns whether a property is locked
	%  lock - locks unreversibly a property
	%  isChecked - returns whether a property is checked
	%  checked - sets a property to checked
	%  unchecked - sets a property to NOT checked
	%
	% BrainSurfacePF methods (display):
	%  tostring - string with information about the panel figure for brain surface
	%  disp - displays information about the panel figure for brain surface
	%  tree - displays the tree of the panel figure for brain surface
	%
	% BrainSurfacePF methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two panel figure for brain surface are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the panel figure for brain surface
	%
	% BrainSurfacePF methods (save/load, Static):
	%  save - saves BRAPH2 panel figure for brain surface as b2 file
	%  load - loads a BRAPH2 panel figure for brain surface from a b2 file
	%
	% BrainSurfacePF method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the panel figure for brain surface
	%
	% BrainSurfacePF method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the panel figure for brain surface
	%
	% BrainSurfacePF methods (inspection, Static):
	%  getClass - returns the class of the panel figure for brain surface
	%  getSubclasses - returns all subclasses of BrainSurfacePF
	%  getProps - returns the property list of the panel figure for brain surface
	%  getPropNumber - returns the property number of the panel figure for brain surface
	%  existsProp - checks whether property exists/error
	%  existsTag - checks whether tag exists/error
	%  getPropProp - returns the property number of a property
	%  getPropTag - returns the tag of a property
	%  getPropCategory - returns the category of a property
	%  getPropFormat - returns the format of a property
	%  getPropDescription - returns the description of a property
	%  getPropSettings - returns the settings of a property
	%  getPropDefault - returns the default value of a property
	%  getPropDefaultConditioned - returns the conditioned default value of a property
	%  checkProp - checks whether a value has the correct format/error
	%
	% BrainSurfacePF methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% BrainSurfacePF methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% BrainSurfacePF methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% BrainSurfacePF methods (format, Static):
	%  getFormats - returns the list of formats
	%  getFormatNumber - returns the number of formats
	%  existsFormat - returns whether a format exists/error
	%  getFormatTag - returns the tag of a format
	%  getFormatName - returns the name of a format
	%  getFormatDescription - returns the description of a format
	%  getFormatSettings - returns the settings for a format
	%  getFormatDefault - returns the default value for a format
	%  checkFormat - returns whether a value format is correct/error
	%
	% To print full list of constants, click here <a href="matlab:metaclass = ?BrainSurfacePF; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">BrainSurfacePF constants</a>.
	%
	%
	% See also BrainSurface.
	%
	% BUILD BRAPH2 6 class_name 1
	
	properties (Constant) % constants
		% fixed 3d view
		VIEW_3D	= 1 % 3D view numeric code
		VIEW_3D_CMD = '3D' % 3D view name
		VIEW_3D_AZEL = [-37.5 30] % 3D view azimutal and polar angles
		
		% sagittal left view
		VIEW_SL	= 2 % sagittal left view numeric code
		VIEW_SL_CMD = 'Sagittal left' % sagittal left view name
		VIEW_SL_AZEL = [-90 0] % sagittal left view azimutal and polar angles
		
		% sagittal right view
		VIEW_SR	= 3 % sagittal right view numeric code
		VIEW_SR_CMD = 'Sagittal right' % sagittal right view name
		VIEW_SR_AZEL = [90 0] % sagittal right view azimutal and polar angles 
		
		% axial dorsal view
		VIEW_AD = 4 % axial dorsal view numeric code
		VIEW_AD_CMD = 'Axial dorsal' % axial dorsal view name
		VIEW_AD_AZEL = [0 90] % axial dorsal view azimutal and polar angles
		
		% axial ventral view
		VIEW_AV = 5 % axial ventral view numeric code
		VIEW_AV_CMD = 'Axial ventral' % axial ventral view name
		VIEW_AV_AZEL = [0 -90] % axial ventral view azimutal and polar angles
		
		% coronal anterior view
		VIEW_CA = 6 % coronal anterior view numeric code
		VIEW_CA_CMD = 'Coronal anterior' % coronal anterior view name
		VIEW_CA_AZEL = [180 0] % coronal anterior view azimutal and polar angles
		
		% coronal posterior view
		VIEW_CP = 7 % coronal posterior view numeric code
		VIEW_CP_CMD = 'Coronal posterior' % coronal posterior view name
		VIEW_CP_AZEL = [0 0] % coronal posterior view azimutal and polar angles
		
		VIEW_CMD = { ... % vector of view names
		    BrainSurfacePF.VIEW_3D_CMD ...
		    BrainSurfacePF.VIEW_SL_CMD ...
		    BrainSurfacePF.VIEW_SR_CMD ...
		    BrainSurfacePF.VIEW_AD_CMD ...
		    BrainSurfacePF.VIEW_AV_CMD ...
		    BrainSurfacePF.VIEW_CA_CMD ...
		    BrainSurfacePF.VIEW_CP_CMD ...
		    }
		
		VIEW_AZEL = { ... % vector of view azimutal and polar angle
		    BrainSurfacePF.VIEW_3D_AZEL ...
		    BrainSurfacePF.VIEW_SL_AZEL ...
		    BrainSurfacePF.VIEW_SR_AZEL ...
		    BrainSurfacePF.VIEW_AD_AZEL ...
		    BrainSurfacePF.VIEW_AV_AZEL ...
		    BrainSurfacePF.VIEW_CA_AZEL ...
		    BrainSurfacePF.VIEW_CP_AZEL ...
		    }
	end
	properties (Constant) % properties
		H_AXES = 23; %CET: Computational Efficiency Trick
		H_AXES_TAG = 'H_AXES';
		H_AXES_CATEGORY = 7;
		H_AXES_FORMAT = 18;
		
		VIEW = 24; %CET: Computational Efficiency Trick
		VIEW_TAG = 'VIEW';
		VIEW_CATEGORY = 8;
		VIEW_FORMAT = 12;
		
		ST_AXIS = 25; %CET: Computational Efficiency Trick
		ST_AXIS_TAG = 'ST_AXIS';
		ST_AXIS_CATEGORY = 8;
		ST_AXIS_FORMAT = 8;
		
		LISTENER_ST_AXIS = 26; %CET: Computational Efficiency Trick
		LISTENER_ST_AXIS_TAG = 'LISTENER_ST_AXIS';
		LISTENER_ST_AXIS_CATEGORY = 7;
		LISTENER_ST_AXIS_FORMAT = 18;
		
		SURFFILE = 27; %CET: Computational Efficiency Trick
		SURFFILE_TAG = 'SURFFILE';
		SURFFILE_CATEGORY = 8;
		SURFFILE_FORMAT = 5;
		
		SURF = 28; %CET: Computational Efficiency Trick
		SURF_TAG = 'SURF';
		SURF_CATEGORY = 2;
		SURF_FORMAT = 8;
		
		H_BRAIN = 29; %CET: Computational Efficiency Trick
		H_BRAIN_TAG = 'H_BRAIN';
		H_BRAIN_CATEGORY = 7;
		H_BRAIN_FORMAT = 18;
		
		BRAIN = 30; %CET: Computational Efficiency Trick
		BRAIN_TAG = 'BRAIN';
		BRAIN_CATEGORY = 8;
		BRAIN_FORMAT = 4;
		
		ST_SURFACE = 31; %CET: Computational Efficiency Trick
		ST_SURFACE_TAG = 'ST_SURFACE';
		ST_SURFACE_CATEGORY = 8;
		ST_SURFACE_FORMAT = 8;
		
		ST_AMBIENT = 32; %CET: Computational Efficiency Trick
		ST_AMBIENT_TAG = 'ST_AMBIENT';
		ST_AMBIENT_CATEGORY = 8;
		ST_AMBIENT_FORMAT = 8;
	end
	methods % constructor
		function pf = BrainSurfacePF(varargin)
			%BrainSurfacePF() creates a panel figure for brain surface.
			%
			% BrainSurfacePF(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% BrainSurfacePF(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			% The list of BrainSurfacePF properties is:
			%  <strong>1</strong> <strong>ELCLASS</strong> 	ELCLASS (constant, string) is the class of the panel figure for brain surface.
			%  <strong>2</strong> <strong>NAME</strong> 	NAME (constant, string) is the name of the panel figure for brain surface.
			%  <strong>3</strong> <strong>DESCRIPTION</strong> 	DESCRIPTION (constant, string) is the description of the panel figure for brain surface.
			%  <strong>4</strong> <strong>TEMPLATE</strong> 	TEMPLATE (parameter, item) is the template of the panel figure for brain surface.
			%  <strong>5</strong> <strong>ID</strong> 	ID (data, string) is a few-letter code for the panel figure for brain surface.
			%  <strong>6</strong> <strong>LABEL</strong> 	LABEL (metadata, string) is an extended label of the panel figure for brain surface.
			%  <strong>7</strong> <strong>NOTES</strong> 	NOTES (metadata, string) are some specific notes about the panel figure for brain surface.
			%  <strong>8</strong> <strong>TOSTRING</strong> 	TOSTRING (query, string) returns a string that represents the concrete element.
			%  <strong>9</strong> <strong>WAITBAR</strong> 	WAITBAR (gui, logical) detemines whether to show the waitbar.
			%  <strong>10</strong> <strong>H_WAITBAR</strong> 	H_WAITBAR (evanescent, handle) is the waitbar handle.
			%  <strong>11</strong> <strong>DRAW</strong> 	DRAW (query, logical) draws the figure brain surface.
			%  <strong>12</strong> <strong>DRAWN</strong> 	DRAWN (query, logical) returns whether the panel has been drawn.
			%  <strong>13</strong> <strong>PARENT</strong> 	PARENT (gui, item) is the panel parent.
			%  <strong>14</strong> <strong>BKGCOLOR</strong> 	BKGCOLOR (figure, color) is the panel background color.
			%  <strong>15</strong> <strong>H</strong> 	H (evanescent, handle) is the panel handle.
			%  <strong>16</strong> <strong>SHOW</strong> 	SHOW (query, logical) shows the figure containing the panel.
			%  <strong>17</strong> <strong>HIDE</strong> 	HIDE (query, logical) hides the figure containing the panel.
			%  <strong>18</strong> <strong>DELETE</strong> 	DELETE (query, logical) resets the handles when the panel figure for brain surface is deleted.
			%  <strong>19</strong> <strong>CLOSE</strong> 	CLOSE (query, logical) closes the figure containing the panel.
			%  <strong>20</strong> <strong>ST_POSITION</strong> 	ST_POSITION (figure, item) determines the panel position.
			%  <strong>21</strong> <strong>H_TOOLBAR</strong> 	H_TOOLBAR (evanescent, handle) returns the handle of the toolbar.
			%  <strong>22</strong> <strong>H_TOOLS</strong> 	H_TOOLS (evanescent, handlelist) is the list of panel-specific tools from the panel figure for brain surface.
			%  <strong>23</strong> <strong>H_AXES</strong> 	H_AXES (evanescent, handle) is the handle for the axes.
			%  <strong>24</strong> <strong>VIEW</strong> 	VIEW (figure, rvector) sets the desired view as the line-of-sight azimuth and elevation angles.
			%  <strong>25</strong> <strong>ST_AXIS</strong> 	ST_AXIS (figure, item) determines the axis settings.
			%  <strong>26</strong> <strong>LISTENER_ST_AXIS</strong> 	LISTENER_ST_AXIS (evanescent, handle) contains the listener to the axis settings to update the pushbuttons.
			%  <strong>27</strong> <strong>SURFFILE</strong> 	SURFFILE (figure, option) is the name of the file of the brain surface to be plotted.
			%  <strong>28</strong> <strong>SURF</strong> 	SURF (metadata, item) is the brain surface to be plotted.
			%  <strong>29</strong> <strong>H_BRAIN</strong> 	H_BRAIN (evanescent, handle) is the handle for brain surface.
			%  <strong>30</strong> <strong>BRAIN</strong> 	BRAIN (figure, logical) determines whether the brain surface is shown.
			%  <strong>31</strong> <strong>ST_SURFACE</strong> 	ST_SURFACE (figure, item) determines the surface settings.
			%  <strong>32</strong> <strong>ST_AMBIENT</strong> 	ST_AMBIENT (figure, item) determines the ambient settings.
			%
			% See also Category, Format.
			
			pf = pf@PanelFig(varargin{:});
		end
	end
	methods (Static) % inspection
		function build = getBuild()
			%GETBUILD returns the build of the panel figure for brain surface.
			%
			% BUILD = BrainSurfacePF.GETBUILD() returns the build of 'BrainSurfacePF'.
			%
			% Alternative forms to call this method are:
			%  BUILD = PF.GETBUILD() returns the build of the panel figure for brain surface PF.
			%  BUILD = Element.GETBUILD(PF) returns the build of 'PF'.
			%  BUILD = Element.GETBUILD('BrainSurfacePF') returns the build of 'BrainSurfacePF'.
			%
			% Note that the Element.GETBUILD(PF) and Element.GETBUILD('BrainSurfacePF')
			%  are less computationally efficient.
			
			build = 1;
		end
		function pf_class = getClass()
			%GETCLASS returns the class of the panel figure for brain surface.
			%
			% CLASS = BrainSurfacePF.GETCLASS() returns the class 'BrainSurfacePF'.
			%
			% Alternative forms to call this method are:
			%  CLASS = PF.GETCLASS() returns the class of the panel figure for brain surface PF.
			%  CLASS = Element.GETCLASS(PF) returns the class of 'PF'.
			%  CLASS = Element.GETCLASS('BrainSurfacePF') returns 'BrainSurfacePF'.
			%
			% Note that the Element.GETCLASS(PF) and Element.GETCLASS('BrainSurfacePF')
			%  are less computationally efficient.
			
			pf_class = 'BrainSurfacePF';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the panel figure for brain surface.
			%
			% LIST = BrainSurfacePF.GETSUBCLASSES() returns all subclasses of 'BrainSurfacePF'.
			%
			% Alternative forms to call this method are:
			%  LIST = PF.GETSUBCLASSES() returns all subclasses of the panel figure for brain surface PF.
			%  LIST = Element.GETSUBCLASSES(PF) returns all subclasses of 'PF'.
			%  LIST = Element.GETSUBCLASSES('BrainSurfacePF') returns all subclasses of 'BrainSurfacePF'.
			%
			% Note that the Element.GETSUBCLASSES(PF) and Element.GETSUBCLASSES('BrainSurfacePF')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = { 'BrainSurfacePF'  'BrainAtlasPF' }; %CET: Computational Efficiency Trick
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of panel figure for brain surface.
			%
			% PROPS = BrainSurfacePF.GETPROPS() returns the property list of panel figure for brain surface
			%  as a row vector.
			%
			% PROPS = BrainSurfacePF.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = PF.GETPROPS([CATEGORY]) returns the property list of the panel figure for brain surface PF.
			%  PROPS = Element.GETPROPS(PF[, CATEGORY]) returns the property list of 'PF'.
			%  PROPS = Element.GETPROPS('BrainSurfacePF'[, CATEGORY]) returns the property list of 'BrainSurfacePF'.
			%
			% Note that the Element.GETPROPS(PF) and Element.GETPROPS('BrainSurfacePF')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			%CET: Computational Efficiency Trick
			
			if nargin == 0
				prop_list = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32];
				return
			end
			
			switch category
				case 1 % Category.CONSTANT
					prop_list = [1 2 3];
				case 2 % Category.METADATA
					prop_list = [6 7 28];
				case 3 % Category.PARAMETER
					prop_list = 4;
				case 4 % Category.DATA
					prop_list = 5;
				case 6 % Category.QUERY
					prop_list = [8 11 12 16 17 18 19];
				case 7 % Category.EVANESCENT
					prop_list = [10 15 21 22 23 26 29];
				case 8 % Category.FIGURE
					prop_list = [14 20 24 25 27 30 31 32];
				case 9 % Category.GUI
					prop_list = [9 13];
				otherwise
					prop_list = [];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of panel figure for brain surface.
			%
			% N = BrainSurfacePF.GETPROPNUMBER() returns the property number of panel figure for brain surface.
			%
			% N = BrainSurfacePF.GETPROPNUMBER(CATEGORY) returns the property number of panel figure for brain surface
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = PF.GETPROPNUMBER([CATEGORY]) returns the property number of the panel figure for brain surface PF.
			%  N = Element.GETPROPNUMBER(PF) returns the property number of 'PF'.
			%  N = Element.GETPROPNUMBER('BrainSurfacePF') returns the property number of 'BrainSurfacePF'.
			%
			% Note that the Element.GETPROPNUMBER(PF) and Element.GETPROPNUMBER('BrainSurfacePF')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			%CET: Computational Efficiency Trick
			
			if nargin == 0
				prop_number = 32;
				return
			end
			
			switch varargin{1} % category = varargin{1}
				case 1 % Category.CONSTANT
					prop_number = 3;
				case 2 % Category.METADATA
					prop_number = 3;
				case 3 % Category.PARAMETER
					prop_number = 1;
				case 4 % Category.DATA
					prop_number = 1;
				case 6 % Category.QUERY
					prop_number = 7;
				case 7 % Category.EVANESCENT
					prop_number = 7;
				case 8 % Category.FIGURE
					prop_number = 8;
				case 9 % Category.GUI
					prop_number = 2;
				otherwise
					prop_number = 0;
			end
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in panel figure for brain surface/error.
			%
			% CHECK = BrainSurfacePF.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = PF.EXISTSPROP(PROP) checks whether PROP exists for PF.
			%  CHECK = Element.EXISTSPROP(PF, PROP) checks whether PROP exists for PF.
			%  CHECK = Element.EXISTSPROP(BrainSurfacePF, PROP) checks whether PROP exists for BrainSurfacePF.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:BrainSurfacePF:WrongInput]
			%
			% Alternative forms to call this method are:
			%  PF.EXISTSPROP(PROP) throws error if PROP does NOT exist for PF.
			%   Error id: [BRAPH2:BrainSurfacePF:WrongInput]
			%  Element.EXISTSPROP(PF, PROP) throws error if PROP does NOT exist for PF.
			%   Error id: [BRAPH2:BrainSurfacePF:WrongInput]
			%  Element.EXISTSPROP(BrainSurfacePF, PROP) throws error if PROP does NOT exist for BrainSurfacePF.
			%   Error id: [BRAPH2:BrainSurfacePF:WrongInput]
			%
			% Note that the Element.EXISTSPROP(PF) and Element.EXISTSPROP('BrainSurfacePF')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = prop >= 1 && prop <= 32 && round(prop) == prop; %CET: Computational Efficiency Trick
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					['BRAPH2' ':BrainSurfacePF:' 'WrongInput'], ...
					['BRAPH2' ':BrainSurfacePF:' 'WrongInput' '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for BrainSurfacePF.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in panel figure for brain surface/error.
			%
			% CHECK = BrainSurfacePF.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = PF.EXISTSTAG(TAG) checks whether TAG exists for PF.
			%  CHECK = Element.EXISTSTAG(PF, TAG) checks whether TAG exists for PF.
			%  CHECK = Element.EXISTSTAG(BrainSurfacePF, TAG) checks whether TAG exists for BrainSurfacePF.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:BrainSurfacePF:WrongInput]
			%
			% Alternative forms to call this method are:
			%  PF.EXISTSTAG(TAG) throws error if TAG does NOT exist for PF.
			%   Error id: [BRAPH2:BrainSurfacePF:WrongInput]
			%  Element.EXISTSTAG(PF, TAG) throws error if TAG does NOT exist for PF.
			%   Error id: [BRAPH2:BrainSurfacePF:WrongInput]
			%  Element.EXISTSTAG(BrainSurfacePF, TAG) throws error if TAG does NOT exist for BrainSurfacePF.
			%   Error id: [BRAPH2:BrainSurfacePF:WrongInput]
			%
			% Note that the Element.EXISTSTAG(PF) and Element.EXISTSTAG('BrainSurfacePF')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(strcmp(tag, { 'ELCLASS'  'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'WAITBAR'  'H_WAITBAR'  'DRAW'  'DRAWN'  'PARENT'  'BKGCOLOR'  'H'  'SHOW'  'HIDE'  'DELETE'  'CLOSE'  'ST_POSITION'  'H_TOOLBAR'  'H_TOOLS'  'H_AXES'  'VIEW'  'ST_AXIS'  'LISTENER_ST_AXIS'  'SURFFILE'  'SURF'  'H_BRAIN'  'BRAIN'  'ST_SURFACE'  'ST_AMBIENT' })); %CET: Computational Efficiency Trick
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					['BRAPH2' ':BrainSurfacePF:' 'WrongInput'], ...
					['BRAPH2' ':BrainSurfacePF:' 'WrongInput' '\n' ...
					'The value ' tag ' is not a valid tag for BrainSurfacePF.'] ...
					)
			end
		end
		function prop = getPropProp(pointer)
			%GETPROPPROP returns the property number of a property.
			%
			% PROP = Element.GETPROPPROP(PROP) returns PROP, i.e., the 
			%  property number of the property PROP.
			%
			% PROP = Element.GETPROPPROP(TAG) returns the property number 
			%  of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  PROPERTY = PF.GETPROPPROP(POINTER) returns property number of POINTER of PF.
			%  PROPERTY = Element.GETPROPPROP(BrainSurfacePF, POINTER) returns property number of POINTER of BrainSurfacePF.
			%  PROPERTY = PF.GETPROPPROP(BrainSurfacePF, POINTER) returns property number of POINTER of BrainSurfacePF.
			%
			% Note that the Element.GETPROPPROP(PF) and Element.GETPROPPROP('BrainSurfacePF')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				prop = find(strcmp(pointer, { 'ELCLASS'  'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'WAITBAR'  'H_WAITBAR'  'DRAW'  'DRAWN'  'PARENT'  'BKGCOLOR'  'H'  'SHOW'  'HIDE'  'DELETE'  'CLOSE'  'ST_POSITION'  'H_TOOLBAR'  'H_TOOLS'  'H_AXES'  'VIEW'  'ST_AXIS'  'LISTENER_ST_AXIS'  'SURFFILE'  'SURF'  'H_BRAIN'  'BRAIN'  'ST_SURFACE'  'ST_AMBIENT' })); % tag = pointer %CET: Computational Efficiency Trick
			else % numeric
				prop = pointer;
			end
		end
		function tag = getPropTag(pointer)
			%GETPROPTAG returns the tag of a property.
			%
			% TAG = Element.GETPROPTAG(PROP) returns the tag TAG of the 
			%  property PROP.
			%
			% TAG = Element.GETPROPTAG(TAG) returns TAG, i.e. the tag of 
			%  the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  TAG = PF.GETPROPTAG(POINTER) returns tag of POINTER of PF.
			%  TAG = Element.GETPROPTAG(BrainSurfacePF, POINTER) returns tag of POINTER of BrainSurfacePF.
			%  TAG = PF.GETPROPTAG(BrainSurfacePF, POINTER) returns tag of POINTER of BrainSurfacePF.
			%
			% Note that the Element.GETPROPTAG(PF) and Element.GETPROPTAG('BrainSurfacePF')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropSettings, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			if ischar(pointer)
				tag = pointer;
			else % numeric
				%CET: Computational Efficiency Trick
				brainsurfacepf_tag_list = { 'ELCLASS'  'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'WAITBAR'  'H_WAITBAR'  'DRAW'  'DRAWN'  'PARENT'  'BKGCOLOR'  'H'  'SHOW'  'HIDE'  'DELETE'  'CLOSE'  'ST_POSITION'  'H_TOOLBAR'  'H_TOOLS'  'H_AXES'  'VIEW'  'ST_AXIS'  'LISTENER_ST_AXIS'  'SURFFILE'  'SURF'  'H_BRAIN'  'BRAIN'  'ST_SURFACE'  'ST_AMBIENT' };
				tag = brainsurfacepf_tag_list{pointer}; % prop = pointer
			end
		end
		function prop_category = getPropCategory(pointer)
			%GETPROPCATEGORY returns the category of a property.
			%
			% CATEGORY = Element.GETPROPCATEGORY(PROP) returns the category of the
			%  property PROP.
			%
			% CATEGORY = Element.GETPROPCATEGORY(TAG) returns the category of the
			%  property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  CATEGORY = PF.GETPROPCATEGORY(POINTER) returns category of POINTER of PF.
			%  CATEGORY = Element.GETPROPCATEGORY(BrainSurfacePF, POINTER) returns category of POINTER of BrainSurfacePF.
			%  CATEGORY = PF.GETPROPCATEGORY(BrainSurfacePF, POINTER) returns category of POINTER of BrainSurfacePF.
			%
			% Note that the Element.GETPROPCATEGORY(PF) and Element.GETPROPCATEGORY('BrainSurfacePF')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = BrainSurfacePF.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			brainsurfacepf_category_list = { 1  1  1  3  4  2  2  6  9  7  6  6  9  8  7  6  6  6  6  8  7  7  7  8  8  7  8  2  7  8  8  8 };
			prop_category = brainsurfacepf_category_list{prop};
		end
		function prop_format = getPropFormat(pointer)
			%GETPROPFORMAT returns the format of a property.
			%
			% FORMAT = Element.GETPROPFORMAT(PROP) returns the
			%  format of the property PROP.
			%
			% FORMAT = Element.GETPROPFORMAT(TAG) returns the
			%  format of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  FORMAT = PF.GETPROPFORMAT(POINTER) returns format of POINTER of PF.
			%  FORMAT = Element.GETPROPFORMAT(BrainSurfacePF, POINTER) returns format of POINTER of BrainSurfacePF.
			%  FORMAT = PF.GETPROPFORMAT(BrainSurfacePF, POINTER) returns format of POINTER of BrainSurfacePF.
			%
			% Note that the Element.GETPROPFORMAT(PF) and Element.GETPROPFORMAT('BrainSurfacePF')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = BrainSurfacePF.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			brainsurfacepf_format_list = { 2  2  2  8  2  2  2  2  4  18  4  4  8  20  18  4  4  4  4  8  18  19  18  12  8  18  5  8  18  4  8  8 };
			prop_format = brainsurfacepf_format_list{prop};
		end
		function prop_description = getPropDescription(pointer)
			%GETPROPDESCRIPTION returns the description of a property.
			%
			% DESCRIPTION = Element.GETPROPDESCRIPTION(PROP) returns the
			%  description of the property PROP.
			%
			% DESCRIPTION = Element.GETPROPDESCRIPTION(TAG) returns the
			%  description of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DESCRIPTION = PF.GETPROPDESCRIPTION(POINTER) returns description of POINTER of PF.
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(BrainSurfacePF, POINTER) returns description of POINTER of BrainSurfacePF.
			%  DESCRIPTION = PF.GETPROPDESCRIPTION(BrainSurfacePF, POINTER) returns description of POINTER of BrainSurfacePF.
			%
			% Note that the Element.GETPROPDESCRIPTION(PF) and Element.GETPROPDESCRIPTION('BrainSurfacePF')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = BrainSurfacePF.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			brainsurfacepf_description_list = { 'ELCLASS (constant, string) is the class of the panel figure for brain surface.'  'NAME (constant, string) is the name of the panel figure for brain surface.'  'DESCRIPTION (constant, string) is the description of the panel figure for brain surface.'  'TEMPLATE (parameter, item) is the template of the panel figure for brain surface.'  'ID (data, string) is a few-letter code for the panel figure for brain surface.'  'LABEL (metadata, string) is an extended label of the panel figure for brain surface.'  'NOTES (metadata, string) are some specific notes about the panel figure for brain surface.'  'TOSTRING (query, string) returns a string that represents the concrete element.'  'WAITBAR (gui, logical) detemines whether to show the waitbar.'  'H_WAITBAR (evanescent, handle) is the waitbar handle.'  'DRAW (query, logical) draws the figure brain surface.'  'DRAWN (query, logical) returns whether the panel has been drawn.'  'PARENT (gui, item) is the panel parent.'  'BKGCOLOR (figure, color) is the panel background color.'  'H (evanescent, handle) is the panel handle.'  'SHOW (query, logical) shows the figure containing the panel.'  'HIDE (query, logical) hides the figure containing the panel.'  'DELETE (query, logical) resets the handles when the panel figure for brain surface is deleted.'  'CLOSE (query, logical) closes the figure containing the panel.'  'ST_POSITION (figure, item) determines the panel position.'  'H_TOOLBAR (evanescent, handle) returns the handle of the toolbar.'  'H_TOOLS (evanescent, handlelist) is the list of panel-specific tools from the panel figure for brain surface.'  'H_AXES (evanescent, handle) is the handle for the axes.'  'VIEW (figure, rvector) sets the desired view as the line-of-sight azimuth and elevation angles.'  'ST_AXIS (figure, item) determines the axis settings.'  'LISTENER_ST_AXIS (evanescent, handle) contains the listener to the axis settings to update the pushbuttons.'  'SURFFILE (figure, option) is the name of the file of the brain surface to be plotted.'  'SURF (metadata, item) is the brain surface to be plotted.'  'H_BRAIN (evanescent, handle) is the handle for brain surface.'  'BRAIN (figure, logical) determines whether the brain surface is shown.'  'ST_SURFACE (figure, item) determines the surface settings.'  'ST_AMBIENT (figure, item) determines the ambient settings.' };
			prop_description = brainsurfacepf_description_list{prop};
		end
		function prop_settings = getPropSettings(pointer)
			%GETPROPSETTINGS returns the settings of a property.
			%
			% SETTINGS = Element.GETPROPSETTINGS(PROP) returns the
			%  settings of the property PROP.
			%
			% SETTINGS = Element.GETPROPSETTINGS(TAG) returns the
			%  settings of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  SETTINGS = PF.GETPROPSETTINGS(POINTER) returns settings of POINTER of PF.
			%  SETTINGS = Element.GETPROPSETTINGS(BrainSurfacePF, POINTER) returns settings of POINTER of BrainSurfacePF.
			%  SETTINGS = PF.GETPROPSETTINGS(BrainSurfacePF, POINTER) returns settings of POINTER of BrainSurfacePF.
			%
			% Note that the Element.GETPROPSETTINGS(PF) and Element.GETPROPSETTINGS('BrainSurfacePF')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = BrainSurfacePF.getPropProp(pointer);
			
			switch prop %CET: Computational Efficiency Trick
				case BrainSurfacePF.H_AXES % __BrainSurfacePF.H_AXES__
					prop_settings = Format.getFormatSettings(18);
				case BrainSurfacePF.VIEW % __BrainSurfacePF.VIEW__
					prop_settings = Format.getFormatSettings(12);
				case BrainSurfacePF.ST_AXIS % __BrainSurfacePF.ST_AXIS__
					prop_settings = 'SettingsAxis';
				case BrainSurfacePF.LISTENER_ST_AXIS % __BrainSurfacePF.LISTENER_ST_AXIS__
					prop_settings = Format.getFormatSettings(18);
				case BrainSurfacePF.SURFFILE % __BrainSurfacePF.SURFFILE__
					prop_settings = {dir([fileparts(which(BRAPH2.LAUNCHER)) filesep() 'brainsurfs' filesep() '*.nv']).name};
				case BrainSurfacePF.SURF % __BrainSurfacePF.SURF__
					prop_settings = 'BrainSurface';
				case BrainSurfacePF.H_BRAIN % __BrainSurfacePF.H_BRAIN__
					prop_settings = Format.getFormatSettings(18);
				case BrainSurfacePF.BRAIN % __BrainSurfacePF.BRAIN__
					prop_settings = Format.getFormatSettings(4);
				case BrainSurfacePF.ST_SURFACE % __BrainSurfacePF.ST_SURFACE__
					prop_settings = 'SettingsSurface';
				case BrainSurfacePF.ST_AMBIENT % __BrainSurfacePF.ST_AMBIENT__
					prop_settings = 'SettingsAmbient';
				case BrainSurfacePF.TEMPLATE % __BrainSurfacePF.TEMPLATE__
					prop_settings = 'BrainSurfacePF';
				otherwise
					prop_settings = getPropSettings@PanelFig(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = BrainSurfacePF.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = BrainSurfacePF.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = PF.GETPROPDEFAULT(POINTER) returns the default value of POINTER of PF.
			%  DEFAULT = Element.GETPROPDEFAULT(BrainSurfacePF, POINTER) returns the default value of POINTER of BrainSurfacePF.
			%  DEFAULT = PF.GETPROPDEFAULT(BrainSurfacePF, POINTER) returns the default value of POINTER of BrainSurfacePF.
			%
			% Note that the Element.GETPROPDEFAULT(PF) and Element.GETPROPDEFAULT('BrainSurfacePF')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = BrainSurfacePF.getPropProp(pointer);
			
			switch prop %CET: Computational Efficiency Trick
				case BrainSurfacePF.H_AXES % __BrainSurfacePF.H_AXES__
					prop_default = Format.getFormatDefault(18, BrainSurfacePF.getPropSettings(prop));
				case BrainSurfacePF.VIEW % __BrainSurfacePF.VIEW__
					prop_default = BrainSurfacePF.VIEW_SL_AZEL;
				case BrainSurfacePF.ST_AXIS % __BrainSurfacePF.ST_AXIS__
					prop_default = SettingsAxis('GRID', false, 'AXIS', false);
				case BrainSurfacePF.LISTENER_ST_AXIS % __BrainSurfacePF.LISTENER_ST_AXIS__
					prop_default = Format.getFormatDefault(18, BrainSurfacePF.getPropSettings(prop));
				case BrainSurfacePF.SURFFILE % __BrainSurfacePF.SURFFILE__
					prop_default = 'human_ICBM152.nv';
				case BrainSurfacePF.SURF % __BrainSurfacePF.SURF__
					prop_default = ImporterBrainSurfaceNV('FILE', BrainSurfacePF.getPropDefault('SURFFILE')).get('SURF');
				case BrainSurfacePF.H_BRAIN % __BrainSurfacePF.H_BRAIN__
					prop_default = Format.getFormatDefault(18, BrainSurfacePF.getPropSettings(prop));
				case BrainSurfacePF.BRAIN % __BrainSurfacePF.BRAIN__
					prop_default = true;
				case BrainSurfacePF.ST_SURFACE % __BrainSurfacePF.ST_SURFACE__
					prop_default = Format.getFormatDefault(8, BrainSurfacePF.getPropSettings(prop));
				case BrainSurfacePF.ST_AMBIENT % __BrainSurfacePF.ST_AMBIENT__
					prop_default = SettingsAmbient('LIGHTING', 'gouraud', 'MATERIAL', 'dull', 'CAMLIGHT', 'headlight (x2)', 'SHADING', 'none', 'COLORMAP', 'none');
				case BrainSurfacePF.ELCLASS % __BrainSurfacePF.ELCLASS__
					prop_default = 'BrainSurfacePF';
				case BrainSurfacePF.NAME % __BrainSurfacePF.NAME__
					prop_default = 'Panel Figure for Brain Surface';
				case BrainSurfacePF.DESCRIPTION % __BrainSurfacePF.DESCRIPTION__
					prop_default = 'A Panel Figure for Brain Surface (BrainSurfacePF) manages the plot of the brain surface choosen by the user. BrainSurfacePF provides the common methods needed to manage the plot of the surface. In particular, the user can change lighting, material, camlight, shadning, colormap, facecolor, brain color, face color, edge color, and background color. A collection of brain surfaces in NV format can be found in the folder ./braph2/brainsurfs/.';
				case BrainSurfacePF.TEMPLATE % __BrainSurfacePF.TEMPLATE__
					prop_default = Format.getFormatDefault(8, BrainSurfacePF.getPropSettings(prop));
				case BrainSurfacePF.ID % __BrainSurfacePF.ID__
					prop_default = 'BrainSurfacePF ID';
				case BrainSurfacePF.LABEL % __BrainSurfacePF.LABEL__
					prop_default = 'BrainSurfacePF label';
				case BrainSurfacePF.NOTES % __BrainSurfacePF.NOTES__
					prop_default = 'BrainSurfacePF notes';
				otherwise
					prop_default = getPropDefault@PanelFig(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = BrainSurfacePF.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = BrainSurfacePF.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = PF.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of PF.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(BrainSurfacePF, POINTER) returns the conditioned default value of POINTER of BrainSurfacePF.
			%  DEFAULT = PF.GETPROPDEFAULTCONDITIONED(BrainSurfacePF, POINTER) returns the conditioned default value of POINTER of BrainSurfacePF.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(PF) and Element.GETPROPDEFAULTCONDITIONED('BrainSurfacePF')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = BrainSurfacePF.getPropProp(pointer);
			
			prop_default = BrainSurfacePF.conditioning(prop, BrainSurfacePF.getPropDefault(prop));
		end
	end
	methods (Static) % checkProp
		function prop_check = checkProp(pointer, value)
			%CHECKPROP checks whether a value has the correct format/error.
			%
			% CHECK = PF.CHECKPROP(POINTER, VALUE) checks whether
			%  VALUE is an acceptable value for the format of the property
			%  POINTER (POINTER = PROP or TAG).
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  CHECK = PF.CHECKPROP(POINTER, VALUE) checks VALUE format for PROP of PF.
			%  CHECK = Element.CHECKPROP(BrainSurfacePF, PROP, VALUE) checks VALUE format for PROP of BrainSurfacePF.
			%  CHECK = PF.CHECKPROP(BrainSurfacePF, PROP, VALUE) checks VALUE format for PROP of BrainSurfacePF.
			% 
			% PF.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: BRAPH2:BrainSurfacePF:WrongInput
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  PF.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of PF.
			%   Error id: BRAPH2:BrainSurfacePF:WrongInput
			%  Element.CHECKPROP(BrainSurfacePF, PROP, VALUE) throws error if VALUE has not a valid format for PROP of BrainSurfacePF.
			%   Error id: BRAPH2:BrainSurfacePF:WrongInput
			%  PF.CHECKPROP(BrainSurfacePF, PROP, VALUE) throws error if VALUE has not a valid format for PROP of BrainSurfacePF.
			%   Error id: BRAPH2:BrainSurfacePF:WrongInput]
			% 
			% Note that the Element.CHECKPROP(PF) and Element.CHECKPROP('BrainSurfacePF')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = BrainSurfacePF.getPropProp(pointer);
			
			switch prop
				case BrainSurfacePF.H_AXES % __BrainSurfacePF.H_AXES__
					check = Format.checkFormat(18, value, BrainSurfacePF.getPropSettings(prop));
				case BrainSurfacePF.VIEW % __BrainSurfacePF.VIEW__
					check = Format.checkFormat(12, value, BrainSurfacePF.getPropSettings(prop));
					if check
						check = length(value) == 2;
					end
				case BrainSurfacePF.ST_AXIS % __BrainSurfacePF.ST_AXIS__
					check = Format.checkFormat(8, value, BrainSurfacePF.getPropSettings(prop));
				case BrainSurfacePF.LISTENER_ST_AXIS % __BrainSurfacePF.LISTENER_ST_AXIS__
					check = Format.checkFormat(18, value, BrainSurfacePF.getPropSettings(prop));
				case BrainSurfacePF.SURFFILE % __BrainSurfacePF.SURFFILE__
					check = Format.checkFormat(5, value, BrainSurfacePF.getPropSettings(prop));
				case BrainSurfacePF.SURF % __BrainSurfacePF.SURF__
					check = Format.checkFormat(8, value, BrainSurfacePF.getPropSettings(prop));
				case BrainSurfacePF.H_BRAIN % __BrainSurfacePF.H_BRAIN__
					check = Format.checkFormat(18, value, BrainSurfacePF.getPropSettings(prop));
				case BrainSurfacePF.BRAIN % __BrainSurfacePF.BRAIN__
					check = Format.checkFormat(4, value, BrainSurfacePF.getPropSettings(prop));
				case BrainSurfacePF.ST_SURFACE % __BrainSurfacePF.ST_SURFACE__
					check = Format.checkFormat(8, value, BrainSurfacePF.getPropSettings(prop));
				case BrainSurfacePF.ST_AMBIENT % __BrainSurfacePF.ST_AMBIENT__
					check = Format.checkFormat(8, value, BrainSurfacePF.getPropSettings(prop));
				case BrainSurfacePF.TEMPLATE % __BrainSurfacePF.TEMPLATE__
					check = Format.checkFormat(8, value, BrainSurfacePF.getPropSettings(prop));
				otherwise
					if prop <= PanelFig.getPropNumber()
						check = checkProp@PanelFig(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					['BRAPH2' ':BrainSurfacePF:' 'WrongInput'], ...
					['BRAPH2' ':BrainSurfacePF:' 'WrongInput' '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' BrainSurfacePF.getPropTag(prop) ' (' BrainSurfacePF.getFormatTag(BrainSurfacePF.getPropFormat(prop)) ').'] ...
					)
			end
		end
	end
	methods (Access=protected) % postset
		function postset(pf, prop)
			%POSTSET postprocessing after a prop has been set.
			%
			% POSTPROCESSING(EL, PROP) postprocessesing after PROP has been set. By
			%  default, this function does not do anything, so it should be implemented
			%  in the subclasses of Element when needed.
			%
			% This postprocessing occurs only when PROP is set.
			%
			% See also conditioning, preset, checkProp, postprocessing, calculateValue,
			%  checkValue.
			
			switch prop
				case BrainSurfacePF.VIEW % __BrainSurfacePF.VIEW__
					if pf.get('DRAWN')
					    view(pf.get('H_AXES'), pf.get('VIEW'))
					    
					    % reset the ambient lighting
					    pf.memorize('ST_AMBIENT').set('PANEL', pf, 'PROP', pf.H_AXES).get('SETUP')
					    
					    % update state of toggle tools
					    toolbar = pf.get('H_TOOLBAR');
					    if check_graphics(toolbar, 'uitoolbar')
					        set(findobj(toolbar, 'Tag', 'TOOL.View3D'), 'State', isequal(pf.get('VIEW'), BrainSurfacePF.VIEW_3D_AZEL))
					        set(findobj(toolbar, 'Tag', 'TOOL.ViewSL'), 'State', isequal(pf.get('VIEW'), BrainSurfacePF.VIEW_SL_AZEL))
					        set(findobj(toolbar, 'Tag', 'TOOL.ViewSR'), 'State', isequal(pf.get('VIEW'), BrainSurfacePF.VIEW_SR_AZEL))
					        set(findobj(toolbar, 'Tag', 'TOOL.ViewAD'), 'State', isequal(pf.get('VIEW'), BrainSurfacePF.VIEW_AD_AZEL))
					        set(findobj(toolbar, 'Tag', 'TOOL.ViewAV'), 'State', isequal(pf.get('VIEW'), BrainSurfacePF.VIEW_AV_AZEL))
					        set(findobj(toolbar, 'Tag', 'TOOL.ViewCA'), 'State', isequal(pf.get('VIEW'), BrainSurfacePF.VIEW_CA_AZEL))
					        set(findobj(toolbar, 'Tag', 'TOOL.ViewCP'), 'State', isequal(pf.get('VIEW'), BrainSurfacePF.VIEW_CP_AZEL))
					    end
					end
					
				case BrainSurfacePF.ST_AXIS % __BrainSurfacePF.ST_AXIS__
					if pf.get('DRAWN')
					    toolbar = pf.get('H_TOOLBAR');
					    if check_graphics(toolbar, 'uitoolbar')
					        set(findobj(toolbar, 'Tag', 'TOOL.Grid'), 'State', pf.get('ST_AXIS').get('GRID'))
					        set(findobj(toolbar, 'Tag', 'TOOL.Axis'), 'State', pf.get('ST_AXIS').get('AXIS'))
					    end
					end
					
				case BrainSurfacePF.SURFFILE % __BrainSurfacePF.SURFFILE__
					bs = ImporterBrainSurfaceNV('FILE', pf.get('SURFFILE')).get('SURF');
					pf.set('SURF', bs)
					
					if pf.get('DRAWN')
					    delete(pf.get('H_BRAIN'))
					    pf.set('H_BRAIN', Element.getNoValue())
					
					    pf.memorize('H_BRAIN')
					
					    pf.set('BRAIN', pf.get('BRAIN'))
					
					    pf.memorize('ST_SURFACE').set('PANEL', pf, 'PROP', pf.H_BRAIN).get('SETUP')
					
					    pf.memorize('ST_AMBIENT').set('PANEL', pf, 'PROP', pf.H_AXES).get('SETUP')
					end
					
				case BrainSurfacePF.BRAIN % __BrainSurfacePF.BRAIN__
					if pf.get('DRAWN')
					    if pf.get('BRAIN')
					        set(pf.get('H_BRAIN'), 'Visible', 'on')
					    else % ~pf.get('BRAIN') 
					        set(pf.get('H_BRAIN'), 'Visible', 'off')
					    end
					
					    toolbar = pf.get('H_TOOLBAR');
					    if check_graphics(toolbar, 'uitoolbar')
					        set(findobj(toolbar, 'Tag', 'TOOL.Brain'), 'State', pf.get('BRAIN'))
					    end
					end
					
				otherwise
					if prop <= PanelFig.getPropNumber()
						postset@PanelFig(pf, prop);
					end
			end
		end
	end
	methods (Access=protected) % calculate value
		function value = calculateValue(pf, prop, varargin)
			%CALCULATEVALUE calculates the value of a property.
			%
			% VALUE = CALCULATEVALUE(EL, PROP) calculates the value of the property
			%  PROP. It works only with properties with 5,
			%  6, and 7. By default this function
			%  returns the default value for the prop and should be implemented in the
			%  subclasses of Element when needed.
			%
			% VALUE = CALCULATEVALUE(EL, PROP, VARARGIN) works with properties with
			%  6.
			%
			% See also getPropDefaultConditioned, conditioning, preset, checkProp,
			%  postset, postprocessing, checkValue.
			
			switch prop
				case BrainSurfacePF.H_AXES % __BrainSurfacePF.H_AXES__
					h_axes = uiaxes( ...
					    'Parent', pf.memorize('H'), ...
					    'Tag', 'H_AXES', ...
					    'Units', 'normalized', ...
					    'OuterPosition', [0 0 1 1] ...
					    );
					h_axes.Toolbar.Visible = 'off';
					h_axes.Interactions = [];
					value = h_axes;
					
				case BrainSurfacePF.LISTENER_ST_AXIS % __BrainSurfacePF.LISTENER_ST_AXIS__
					value = listener(pf.get('ST_AXIS'), 'PropSet', @cb_listener_st_axis);
					
				case BrainSurfacePF.H_BRAIN % __BrainSurfacePF.H_BRAIN__
					triangles = pf.get('SURF').get('TRIANGLES');
					coordinates = pf.get('SURF').get('COORDINATES');
					h_brain = trisurf( ...
					    triangles, ...
					    coordinates(:, 1), ...
					    coordinates(:, 2), ...
					    coordinates(:, 3), ...
					    'Parent', pf.memorize('H_AXES'), ...
					    'Tag', 'H_BRAIN' ...
					    );
					xlabel(pf.get('H_AXES'), 'Sagittal')
					ylabel(pf.get('H_AXES'), 'Axial')
					zlabel(pf.get('H_AXES'), 'Coronal')
					value = h_brain;
					
				case BrainSurfacePF.DRAW % __BrainSurfacePF.DRAW__
					value = calculateValue@PanelFig(pf, PanelFig.DRAW, varargin{:}); % also warning
					if value
					    pf.memorize('H_AXES')
					    
					    pf.set('VIEW', pf.get('VIEW'))
					
					    pf.memorize('ST_AXIS').set('PANEL', pf, 'PROP', BrainSurfacePF.H_AXES).get('SETUP')
					    pf.memorize('LISTENER_ST_AXIS');
					    
					    pf.memorize('H_BRAIN')
					
					    pf.set('BRAIN', pf.get('BRAIN'))
					
					    pf.memorize('ST_SURFACE').set('PANEL', pf, 'PROP', BrainSurfacePF.H_BRAIN).get('SETUP')
					    
					    pf.memorize('ST_AMBIENT').set('PANEL', pf, 'PROP', BrainSurfacePF.H_AXES).get('SETUP')
					end
					
				case BrainSurfacePF.DELETE % __BrainSurfacePF.DELETE__
					value = calculateValue@PanelFig(pf, PanelFig.DELETE, varargin{:}); % also warning
					if value
					    pf.set('H_AXES', Element.getNoValue())
					    pf.set('H_BRAIN', Element.getNoValue())
					    
					    pf.set('LISTENER_ST_AXIS', Element.getNoValue())
					end
					
				case BrainSurfacePF.H_TOOLS % __BrainSurfacePF.H_TOOLS__
					toolbar = pf.memorize('H_TOOLBAR');
					if check_graphics(toolbar, 'uitoolbar')
					    value = calculateValue@PanelFig(pf, PanelFig.H_TOOLS);
					    
					    tool_separator_1 = uipushtool(toolbar, 'Separator', 'on', 'Visible', 'off');
					
					    % Brain
					    tool_brain = uitoggletool(toolbar, ...
					        'Tag', 'TOOL.Brain', ...
					        'Separator', 'on', ...
					        'State', pf.get('BRAIN'), ...
					        'Tooltip', 'Show Brain', ...
					        'CData', imread('icon_brain.png'), ...
					        'OnCallback', {@cb_brain, true}, ...
					        'OffCallback', {@cb_brain, false});
					
					    % Axis
					    tool_axis = uitoggletool(toolbar, ...
					        'Tag', 'TOOL.Axis', ...
					        'State', pf.get('ST_AXIS').get('AXIS'), ...
					        'Tooltip', 'Show axis', ...
					        'CData', imread('icon_axis.png'), ...
					        'OnCallback', {@cb_axis, true}, ...
					        'OffCallback', {@cb_axis, false});
					
					    % Grid
					    tool_grid = uitoggletool(toolbar, ...
					        'Tag', 'TOOL.Grid', ...
					        'State', pf.get('ST_AXIS').get('GRID'), ...
					        'Tooltip', 'Show grid', ...
					        'CData', imread('icon_grid.png'), ...
					        'OnCallback', {@cb_grid, true}, ...
					        'OffCallback', {@cb_grid, false});
					        
					    tool_separator_2 = uipushtool(toolbar, 'Separator', 'on', 'Visible', 'off');
					
					    % View 3D
					    tool_view3D = uitoggletool(toolbar, ...
					        'Tag', 'TOOL.View3D', ...
					        'Separator', 'on', ... 
					        'State', isequal(pf.get('VIEW'), BrainSurfacePF.VIEW_3D_AZEL), ...
					        'Tooltip', BrainSurfacePF.VIEW_3D_CMD, ...
					        'CData', imread('icon_view_3d.png'), ...
					        'ClickedCallback', {@cb_view, BrainSurfacePF.VIEW_3D_AZEL});
					
					    % View SL
					    tool_viewSL = uitoggletool(toolbar, ...
					        'Tag', 'TOOL.ViewSL', ...
					        'State', isequal(pf.get('VIEW'), BrainSurfacePF.VIEW_SL_AZEL), ...
					        'Tooltip', BrainSurfacePF.VIEW_SL_CMD, ...
					        'CData', imread('icon_view_sl.png'), ...
					        'ClickedCallback', {@cb_view, BrainSurfacePF.VIEW_SL_AZEL});
					
					    % View SR
					    tool_viewSR = uitoggletool(toolbar, ...
					        'Tag', 'TOOL.ViewSR', ...
					        'State', isequal(pf.get('VIEW'), BrainSurfacePF.VIEW_SR_AZEL), ...
					        'Tooltip', BrainSurfacePF.VIEW_SR_CMD, ...
					        'CData', imread('icon_view_sr.png'), ...
					        'ClickedCallback', {@cb_view, BrainSurfacePF.VIEW_SR_AZEL});
					
					    % View AD
					    tool_viewAD = uitoggletool(toolbar, ...
					        'Tag', 'TOOL.ViewAD', ...
					        'State', isequal(pf.get('VIEW'), BrainSurfacePF.VIEW_AD_AZEL), ...
					        'Tooltip', BrainSurfacePF.VIEW_AD_CMD, ...
					        'CData', imread('icon_view_ad.png'), ...
					        'ClickedCallback', {@cb_view, BrainSurfacePF.VIEW_AD_AZEL});
					
					    % View AV
					    tool_viewAV = uitoggletool(toolbar, ...
					        'Tag', 'TOOL.ViewAV', ...
					        'State', isequal(pf.get('VIEW'), BrainSurfacePF.VIEW_AV_AZEL), ...
					        'Tooltip', BrainSurfacePF.VIEW_AV_CMD, ...
					        'CData', imread('icon_view_av.png'), ...
					        'ClickedCallback', {@cb_view, BrainSurfacePF.VIEW_AV_AZEL});
					
					    % View CA
					    tool_viewCA = uitoggletool(toolbar, ...
					        'Tag', 'TOOL.ViewCA', ...
					        'State', isequal(pf.get('VIEW'), BrainSurfacePF.VIEW_CA_AZEL), ...
					        'Tooltip', BrainSurfacePF.VIEW_CA_CMD, ...
					        'CData', imread('icon_view_ca.png'), ...
					        'ClickedCallback', {@cb_view, BrainSurfacePF.VIEW_CA_AZEL});
					
					    % View CP
					    tool_viewCP = uitoggletool(toolbar, ...
					        'Tag', 'TOOL.ViewCP', ...
					        'State', isequal(pf.get('VIEW'), BrainSurfacePF.VIEW_CP_AZEL), ...
					        'Tooltip', BrainSurfacePF.VIEW_CP_CMD, ...
					        'CData', imread('icon_view_cp.png'), ...
					        'ClickedCallback', {@cb_view, BrainSurfacePF.VIEW_CP_AZEL});
					    
					    value = {value{:}, ...
					        tool_separator_1, ...
					        tool_brain, tool_axis, tool_grid, ...
					        tool_separator_2, ...
					        tool_view3D, tool_viewSL, tool_viewSL, tool_viewSR, tool_viewAD, tool_viewAV, tool_viewCA, tool_viewCP ...
					        };
					else
					    value = {};
					end
					
				otherwise
					if prop <= PanelFig.getPropNumber()
						value = calculateValue@PanelFig(pf, prop, varargin{:});
					else
						value = calculateValue@Element(pf, prop, varargin{:});
					end
			end
			
			function cb_listener_st_axis(~, ~)
			    if pf.get('DRAWN')
			        toolbar = pf.get('H_TOOLBAR');
			        if check_graphics(toolbar, 'uitoolbar')
			            set(findobj(toolbar, 'Tag', 'TOOL.Grid'), 'State', pf.get('ST_AXIS').get('GRID'))
			            set(findobj(toolbar, 'Tag', 'TOOL.Axis'), 'State', pf.get('ST_AXIS').get('AXIS'))
			        end
			    end
			end
			function cb_brain(~, ~, brain) % (src, event)
			    pf.set('BRAIN', brain)
			end
			function cb_axis(~, ~, axis) % (src, event)
			    pf.get('ST_AXIS').set('AXIS', axis);
			    
			    % triggers the update of ST_AXIS
			    pf.set('ST_AXIS', pf.get('ST_AXIS'))
			end
			function cb_grid(~, ~, grid) % (src, event)
			    pf.get('ST_AXIS').set('GRID', grid);
			
			    % triggers the update of ST_AXIS
			    pf.set('ST_AXIS', pf.get('ST_AXIS'))
			end
			function cb_view(~, ~, azel) % (src, event)
			    pf.set('VIEW', azel)
			end
		end
	end
	methods % GUI
		function pr = getPanelProp(pf, prop, varargin)
			%GETPANELPROP returns a prop panel.
			%
			% PR = GETPANELPROP(EL, PROP) returns the panel of prop PROP.
			%
			% PR = GETPANELPROP(EL, PROP, 'Name', Value, ...) sets the properties 
			%  of the panel prop.
			%
			% See also PanelProp, PanelPropAlpha, PanelPropCell, PanelPropClass,
			%  PanelPropClassList, PanelPropColor, PanelPropHandle,
			%  PanelPropHandleList, PanelPropIDict, PanelPropItem, PanelPropLine,
			%  PanelPropItemList, PanelPropLogical, PanelPropMarker, PanelPropMatrix,
			%  PanelPropNet, PanelPropOption, PanelPropScalar, PanelPropSize,
			%  PanelPropString, PanelPropStringList.
			
			switch prop
				case BrainSurfacePF.VIEW % __BrainSurfacePF.VIEW__
					pr = PanelPropRVectorView('EL', pf, 'PROP', BrainSurfacePF.VIEW, varargin{:});
					
				case BrainSurfacePF.ST_AXIS % __BrainSurfacePF.ST_AXIS__
					pr = SettingsAxisPP('EL', pf, 'PROP', BrainSurfacePF.ST_AXIS, varargin{:});
					
				case BrainSurfacePF.ST_SURFACE % __BrainSurfacePF.ST_SURFACE__
					pr = SettingsSurfacePP('EL', pf, 'PROP', BrainSurfacePF.ST_SURFACE, varargin{:});
					
				case BrainSurfacePF.ST_AMBIENT % __BrainSurfacePF.ST_AMBIENT__
					pr = SettingsAmbientPP('EL', pf, 'PROP', BrainSurfacePF.ST_AMBIENT, varargin{:});
					
				otherwise
					pr = getPanelProp@PanelFig(pf, prop, varargin{:});
					
			end
		end
	end
end
