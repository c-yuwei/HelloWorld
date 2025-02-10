classdef StringCombine < ConcreteElement
	%StringCombine combines the string from two string units.
	% It is a subclass of <a href="matlab:help ConcreteElement">ConcreteElement</a>.
	%
	% A String Combine (StringCombine) combines the strings from two string units.
	% This element is created for distribution demonstration purpose.
	%
	% The list of StringCombine properties is:
	%  <strong>1</strong> <strong>ELCLASS</strong> 	ELCLASS (constant, string) is the class of the string combine.
	%  <strong>2</strong> <strong>NAME</strong> 	NAME (constant, string) is the name of the string combine.
	%  <strong>3</strong> <strong>DESCRIPTION</strong> 	DESCRIPTION (constant, string) is the description of the string combine.
	%  <strong>4</strong> <strong>TEMPLATE</strong> 	TEMPLATE (parameter, item) is the template of the string combine.
	%  <strong>5</strong> <strong>ID</strong> 	ID (data, string) is a few-letter code for the string combine.
	%  <strong>6</strong> <strong>LABEL</strong> 	LABEL (metadata, string) is an extended label of the string combine.
	%  <strong>7</strong> <strong>NOTES</strong> 	NOTES (metadata, string) are some specific notes about the string combine.
	%  <strong>8</strong> <strong>TOSTRING</strong> 	TOSTRING (query, string) returns a string that represents the concrete element.
	%  <strong>9</strong> <strong>SU1</strong> 	SU1 (data, item) is the first string unit.
	%  <strong>10</strong> <strong>SU2</strong> 	SU2 (data, item) is the second string unit.
	%  <strong>11</strong> <strong>S_COMBINED</strong> 	S_COMBINED (result, string) is the combined strings.
	%
	% StringCombine methods (constructor):
	%  StringCombine - constructor
	%
	% StringCombine methods:
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
	% StringCombine methods (display):
	%  tostring - string with information about the string combine
	%  disp - displays information about the string combine
	%  tree - displays the tree of the string combine
	%
	% StringCombine methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two string combine are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the string combine
	%
	% StringCombine methods (save/load, Static):
	%  save - saves BRAPH2 string combine as b2 file
	%  load - loads a BRAPH2 string combine from a b2 file
	%
	% StringCombine method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the string combine
	%
	% StringCombine method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the string combine
	%
	% StringCombine methods (inspection, Static):
	%  getClass - returns the class of the string combine
	%  getSubclasses - returns all subclasses of StringCombine
	%  getProps - returns the property list of the string combine
	%  getPropNumber - returns the property number of the string combine
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
	% StringCombine methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% StringCombine methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% StringCombine methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% StringCombine methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?StringCombine; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">StringCombine constants</a>.
	%
	%
	% See also StringUnit, PanelPropString.
	%
	% BUILD BRAPH2 7 class_name 1
	
	properties (Constant) % properties
		SU1 = 9; %CET: Computational Efficiency Trick
		SU1_TAG = 'SU1';
		SU1_CATEGORY = 4;
		SU1_FORMAT = 8;
		
		SU2 = 10; %CET: Computational Efficiency Trick
		SU2_TAG = 'SU2';
		SU2_CATEGORY = 4;
		SU2_FORMAT = 8;
		
		S_COMBINED = 11; %CET: Computational Efficiency Trick
		S_COMBINED_TAG = 'S_COMBINED';
		S_COMBINED_CATEGORY = 5;
		S_COMBINED_FORMAT = 2;
	end
	methods % constructor
		function sc = StringCombine(varargin)
			%StringCombine() creates a string combine.
			%
			% StringCombine(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% StringCombine(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			% The list of StringCombine properties is:
			%  <strong>1</strong> <strong>ELCLASS</strong> 	ELCLASS (constant, string) is the class of the string combine.
			%  <strong>2</strong> <strong>NAME</strong> 	NAME (constant, string) is the name of the string combine.
			%  <strong>3</strong> <strong>DESCRIPTION</strong> 	DESCRIPTION (constant, string) is the description of the string combine.
			%  <strong>4</strong> <strong>TEMPLATE</strong> 	TEMPLATE (parameter, item) is the template of the string combine.
			%  <strong>5</strong> <strong>ID</strong> 	ID (data, string) is a few-letter code for the string combine.
			%  <strong>6</strong> <strong>LABEL</strong> 	LABEL (metadata, string) is an extended label of the string combine.
			%  <strong>7</strong> <strong>NOTES</strong> 	NOTES (metadata, string) are some specific notes about the string combine.
			%  <strong>8</strong> <strong>TOSTRING</strong> 	TOSTRING (query, string) returns a string that represents the concrete element.
			%  <strong>9</strong> <strong>SU1</strong> 	SU1 (data, item) is the first string unit.
			%  <strong>10</strong> <strong>SU2</strong> 	SU2 (data, item) is the second string unit.
			%  <strong>11</strong> <strong>S_COMBINED</strong> 	S_COMBINED (result, string) is the combined strings.
			%
			% See also Category, Format.
			
			sc = sc@ConcreteElement(varargin{:});
		end
	end
	methods (Static) % inspection
		function build = getBuild()
			%GETBUILD returns the build of the string combine.
			%
			% BUILD = StringCombine.GETBUILD() returns the build of 'StringCombine'.
			%
			% Alternative forms to call this method are:
			%  BUILD = SC.GETBUILD() returns the build of the string combine SC.
			%  BUILD = Element.GETBUILD(SC) returns the build of 'SC'.
			%  BUILD = Element.GETBUILD('StringCombine') returns the build of 'StringCombine'.
			%
			% Note that the Element.GETBUILD(SC) and Element.GETBUILD('StringCombine')
			%  are less computationally efficient.
			
			build = 1;
		end
		function sc_class = getClass()
			%GETCLASS returns the class of the string combine.
			%
			% CLASS = StringCombine.GETCLASS() returns the class 'StringCombine'.
			%
			% Alternative forms to call this method are:
			%  CLASS = SC.GETCLASS() returns the class of the string combine SC.
			%  CLASS = Element.GETCLASS(SC) returns the class of 'SC'.
			%  CLASS = Element.GETCLASS('StringCombine') returns 'StringCombine'.
			%
			% Note that the Element.GETCLASS(SC) and Element.GETCLASS('StringCombine')
			%  are less computationally efficient.
			
			sc_class = 'StringCombine';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the string combine.
			%
			% LIST = StringCombine.GETSUBCLASSES() returns all subclasses of 'StringCombine'.
			%
			% Alternative forms to call this method are:
			%  LIST = SC.GETSUBCLASSES() returns all subclasses of the string combine SC.
			%  LIST = Element.GETSUBCLASSES(SC) returns all subclasses of 'SC'.
			%  LIST = Element.GETSUBCLASSES('StringCombine') returns all subclasses of 'StringCombine'.
			%
			% Note that the Element.GETSUBCLASSES(SC) and Element.GETSUBCLASSES('StringCombine')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = { 'StringCombine' }; %CET: Computational Efficiency Trick
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of string combine.
			%
			% PROPS = StringCombine.GETPROPS() returns the property list of string combine
			%  as a row vector.
			%
			% PROPS = StringCombine.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = SC.GETPROPS([CATEGORY]) returns the property list of the string combine SC.
			%  PROPS = Element.GETPROPS(SC[, CATEGORY]) returns the property list of 'SC'.
			%  PROPS = Element.GETPROPS('StringCombine'[, CATEGORY]) returns the property list of 'StringCombine'.
			%
			% Note that the Element.GETPROPS(SC) and Element.GETPROPS('StringCombine')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			%CET: Computational Efficiency Trick
			
			if nargin == 0
				prop_list = [1 2 3 4 5 6 7 8 9 10 11];
				return
			end
			
			switch category
				case 1 % Category.CONSTANT
					prop_list = [1 2 3];
				case 2 % Category.METADATA
					prop_list = [6 7];
				case 3 % Category.PARAMETER
					prop_list = 4;
				case 4 % Category.DATA
					prop_list = [5 9 10];
				case 5 % Category.RESULT
					prop_list = 11;
				case 6 % Category.QUERY
					prop_list = 8;
				otherwise
					prop_list = [];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of string combine.
			%
			% N = StringCombine.GETPROPNUMBER() returns the property number of string combine.
			%
			% N = StringCombine.GETPROPNUMBER(CATEGORY) returns the property number of string combine
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = SC.GETPROPNUMBER([CATEGORY]) returns the property number of the string combine SC.
			%  N = Element.GETPROPNUMBER(SC) returns the property number of 'SC'.
			%  N = Element.GETPROPNUMBER('StringCombine') returns the property number of 'StringCombine'.
			%
			% Note that the Element.GETPROPNUMBER(SC) and Element.GETPROPNUMBER('StringCombine')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			%CET: Computational Efficiency Trick
			
			if nargin == 0
				prop_number = 11;
				return
			end
			
			switch varargin{1} % category = varargin{1}
				case 1 % Category.CONSTANT
					prop_number = 3;
				case 2 % Category.METADATA
					prop_number = 2;
				case 3 % Category.PARAMETER
					prop_number = 1;
				case 4 % Category.DATA
					prop_number = 3;
				case 5 % Category.RESULT
					prop_number = 1;
				case 6 % Category.QUERY
					prop_number = 1;
				otherwise
					prop_number = 0;
			end
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in string combine/error.
			%
			% CHECK = StringCombine.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = SC.EXISTSPROP(PROP) checks whether PROP exists for SC.
			%  CHECK = Element.EXISTSPROP(SC, PROP) checks whether PROP exists for SC.
			%  CHECK = Element.EXISTSPROP(StringCombine, PROP) checks whether PROP exists for StringCombine.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:StringCombine:WrongInput]
			%
			% Alternative forms to call this method are:
			%  SC.EXISTSPROP(PROP) throws error if PROP does NOT exist for SC.
			%   Error id: [BRAPH2:StringCombine:WrongInput]
			%  Element.EXISTSPROP(SC, PROP) throws error if PROP does NOT exist for SC.
			%   Error id: [BRAPH2:StringCombine:WrongInput]
			%  Element.EXISTSPROP(StringCombine, PROP) throws error if PROP does NOT exist for StringCombine.
			%   Error id: [BRAPH2:StringCombine:WrongInput]
			%
			% Note that the Element.EXISTSPROP(SC) and Element.EXISTSPROP('StringCombine')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = prop >= 1 && prop <= 11 && round(prop) == prop; %CET: Computational Efficiency Trick
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					['BRAPH2' ':StringCombine:' 'WrongInput'], ...
					['BRAPH2' ':StringCombine:' 'WrongInput' '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for StringCombine.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in string combine/error.
			%
			% CHECK = StringCombine.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = SC.EXISTSTAG(TAG) checks whether TAG exists for SC.
			%  CHECK = Element.EXISTSTAG(SC, TAG) checks whether TAG exists for SC.
			%  CHECK = Element.EXISTSTAG(StringCombine, TAG) checks whether TAG exists for StringCombine.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:StringCombine:WrongInput]
			%
			% Alternative forms to call this method are:
			%  SC.EXISTSTAG(TAG) throws error if TAG does NOT exist for SC.
			%   Error id: [BRAPH2:StringCombine:WrongInput]
			%  Element.EXISTSTAG(SC, TAG) throws error if TAG does NOT exist for SC.
			%   Error id: [BRAPH2:StringCombine:WrongInput]
			%  Element.EXISTSTAG(StringCombine, TAG) throws error if TAG does NOT exist for StringCombine.
			%   Error id: [BRAPH2:StringCombine:WrongInput]
			%
			% Note that the Element.EXISTSTAG(SC) and Element.EXISTSTAG('StringCombine')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(strcmp(tag, { 'ELCLASS'  'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'SU1'  'SU2'  'S_COMBINED' })); %CET: Computational Efficiency Trick
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					['BRAPH2' ':StringCombine:' 'WrongInput'], ...
					['BRAPH2' ':StringCombine:' 'WrongInput' '\n' ...
					'The value ' tag ' is not a valid tag for StringCombine.'] ...
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
			%  PROPERTY = SC.GETPROPPROP(POINTER) returns property number of POINTER of SC.
			%  PROPERTY = Element.GETPROPPROP(StringCombine, POINTER) returns property number of POINTER of StringCombine.
			%  PROPERTY = SC.GETPROPPROP(StringCombine, POINTER) returns property number of POINTER of StringCombine.
			%
			% Note that the Element.GETPROPPROP(SC) and Element.GETPROPPROP('StringCombine')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				prop = find(strcmp(pointer, { 'ELCLASS'  'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'SU1'  'SU2'  'S_COMBINED' })); % tag = pointer %CET: Computational Efficiency Trick
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
			%  TAG = SC.GETPROPTAG(POINTER) returns tag of POINTER of SC.
			%  TAG = Element.GETPROPTAG(StringCombine, POINTER) returns tag of POINTER of StringCombine.
			%  TAG = SC.GETPROPTAG(StringCombine, POINTER) returns tag of POINTER of StringCombine.
			%
			% Note that the Element.GETPROPTAG(SC) and Element.GETPROPTAG('StringCombine')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropSettings, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			if ischar(pointer)
				tag = pointer;
			else % numeric
				%CET: Computational Efficiency Trick
				stringcombine_tag_list = { 'ELCLASS'  'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'SU1'  'SU2'  'S_COMBINED' };
				tag = stringcombine_tag_list{pointer}; % prop = pointer
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
			%  CATEGORY = SC.GETPROPCATEGORY(POINTER) returns category of POINTER of SC.
			%  CATEGORY = Element.GETPROPCATEGORY(StringCombine, POINTER) returns category of POINTER of StringCombine.
			%  CATEGORY = SC.GETPROPCATEGORY(StringCombine, POINTER) returns category of POINTER of StringCombine.
			%
			% Note that the Element.GETPROPCATEGORY(SC) and Element.GETPROPCATEGORY('StringCombine')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = StringCombine.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			stringcombine_category_list = { 1  1  1  3  4  2  2  6  4  4  5 };
			prop_category = stringcombine_category_list{prop};
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
			%  FORMAT = SC.GETPROPFORMAT(POINTER) returns format of POINTER of SC.
			%  FORMAT = Element.GETPROPFORMAT(StringCombine, POINTER) returns format of POINTER of StringCombine.
			%  FORMAT = SC.GETPROPFORMAT(StringCombine, POINTER) returns format of POINTER of StringCombine.
			%
			% Note that the Element.GETPROPFORMAT(SC) and Element.GETPROPFORMAT('StringCombine')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = StringCombine.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			stringcombine_format_list = { 2  2  2  8  2  2  2  2  8  8  2 };
			prop_format = stringcombine_format_list{prop};
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
			%  DESCRIPTION = SC.GETPROPDESCRIPTION(POINTER) returns description of POINTER of SC.
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(StringCombine, POINTER) returns description of POINTER of StringCombine.
			%  DESCRIPTION = SC.GETPROPDESCRIPTION(StringCombine, POINTER) returns description of POINTER of StringCombine.
			%
			% Note that the Element.GETPROPDESCRIPTION(SC) and Element.GETPROPDESCRIPTION('StringCombine')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = StringCombine.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			stringcombine_description_list = { 'ELCLASS (constant, string) is the class of the string combine.'  'NAME (constant, string) is the name of the string combine.'  'DESCRIPTION (constant, string) is the description of the string combine.'  'TEMPLATE (parameter, item) is the template of the string combine.'  'ID (data, string) is a few-letter code for the string combine.'  'LABEL (metadata, string) is an extended label of the string combine.'  'NOTES (metadata, string) are some specific notes about the string combine.'  'TOSTRING (query, string) returns a string that represents the concrete element.'  'SU1 (data, item) is the first string unit.'  'SU2 (data, item) is the second string unit.'  'S_COMBINED (result, string) is the combined strings.' };
			prop_description = stringcombine_description_list{prop};
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
			%  SETTINGS = SC.GETPROPSETTINGS(POINTER) returns settings of POINTER of SC.
			%  SETTINGS = Element.GETPROPSETTINGS(StringCombine, POINTER) returns settings of POINTER of StringCombine.
			%  SETTINGS = SC.GETPROPSETTINGS(StringCombine, POINTER) returns settings of POINTER of StringCombine.
			%
			% Note that the Element.GETPROPSETTINGS(SC) and Element.GETPROPSETTINGS('StringCombine')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = StringCombine.getPropProp(pointer);
			
			switch prop %CET: Computational Efficiency Trick
				case 9 % StringCombine.SU1
					prop_settings = 'StringUnit';
				case 10 % StringCombine.SU2
					prop_settings = 'StringUnit';
				case 11 % StringCombine.S_COMBINED
					prop_settings = Format.getFormatSettings(2);
				case 4 % StringCombine.TEMPLATE
					prop_settings = 'StringCombine';
				otherwise
					prop_settings = getPropSettings@ConcreteElement(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = StringCombine.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = StringCombine.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = SC.GETPROPDEFAULT(POINTER) returns the default value of POINTER of SC.
			%  DEFAULT = Element.GETPROPDEFAULT(StringCombine, POINTER) returns the default value of POINTER of StringCombine.
			%  DEFAULT = SC.GETPROPDEFAULT(StringCombine, POINTER) returns the default value of POINTER of StringCombine.
			%
			% Note that the Element.GETPROPDEFAULT(SC) and Element.GETPROPDEFAULT('StringCombine')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = StringCombine.getPropProp(pointer);
			
			switch prop %CET: Computational Efficiency Trick
				case 9 % StringCombine.SU1
					prop_default = Format.getFormatDefault(8, StringCombine.getPropSettings(prop));
				case 10 % StringCombine.SU2
					prop_default = Format.getFormatDefault(8, StringCombine.getPropSettings(prop));
				case 11 % StringCombine.S_COMBINED
					prop_default = Format.getFormatDefault(2, StringCombine.getPropSettings(prop));
				case 1 % StringCombine.ELCLASS
					prop_default = 'StringCombine';
				case 2 % StringCombine.NAME
					prop_default = 'String Combine';
				case 3 % StringCombine.DESCRIPTION
					prop_default = 'A String Combine (StringCombine) combines the strings from two string units. This element is created for distribution demonstration purpose.';
				case 4 % StringCombine.TEMPLATE
					prop_default = Format.getFormatDefault(8, StringCombine.getPropSettings(prop));
				case 5 % StringCombine.ID
					prop_default = 'StringCombine ID';
				case 6 % StringCombine.LABEL
					prop_default = 'StringCombine label';
				case 7 % StringCombine.NOTES
					prop_default = 'StringCombine notes';
				otherwise
					prop_default = getPropDefault@ConcreteElement(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = StringCombine.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = StringCombine.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = SC.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of SC.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(StringCombine, POINTER) returns the conditioned default value of POINTER of StringCombine.
			%  DEFAULT = SC.GETPROPDEFAULTCONDITIONED(StringCombine, POINTER) returns the conditioned default value of POINTER of StringCombine.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(SC) and Element.GETPROPDEFAULTCONDITIONED('StringCombine')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = StringCombine.getPropProp(pointer);
			
			prop_default = StringCombine.conditioning(prop, StringCombine.getPropDefault(prop));
		end
	end
	methods (Static) % checkProp
		function prop_check = checkProp(pointer, value)
			%CHECKPROP checks whether a value has the correct format/error.
			%
			% CHECK = SC.CHECKPROP(POINTER, VALUE) checks whether
			%  VALUE is an acceptable value for the format of the property
			%  POINTER (POINTER = PROP or TAG).
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  CHECK = SC.CHECKPROP(POINTER, VALUE) checks VALUE format for PROP of SC.
			%  CHECK = Element.CHECKPROP(StringCombine, PROP, VALUE) checks VALUE format for PROP of StringCombine.
			%  CHECK = SC.CHECKPROP(StringCombine, PROP, VALUE) checks VALUE format for PROP of StringCombine.
			% 
			% SC.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: BRAPH2:StringCombine:WrongInput
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  SC.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of SC.
			%   Error id: BRAPH2:StringCombine:WrongInput
			%  Element.CHECKPROP(StringCombine, PROP, VALUE) throws error if VALUE has not a valid format for PROP of StringCombine.
			%   Error id: BRAPH2:StringCombine:WrongInput
			%  SC.CHECKPROP(StringCombine, PROP, VALUE) throws error if VALUE has not a valid format for PROP of StringCombine.
			%   Error id: BRAPH2:StringCombine:WrongInput]
			% 
			% Note that the Element.CHECKPROP(SC) and Element.CHECKPROP('StringCombine')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = StringCombine.getPropProp(pointer);
			
			switch prop
				case 9 % StringCombine.SU1
					check = Format.checkFormat(8, value, StringCombine.getPropSettings(prop));
				case 10 % StringCombine.SU2
					check = Format.checkFormat(8, value, StringCombine.getPropSettings(prop));
				case 11 % StringCombine.S_COMBINED
					check = Format.checkFormat(2, value, StringCombine.getPropSettings(prop));
				case 4 % StringCombine.TEMPLATE
					check = Format.checkFormat(8, value, StringCombine.getPropSettings(prop));
				otherwise
					if prop <= 8
						check = checkProp@ConcreteElement(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					['BRAPH2' ':StringCombine:' 'WrongInput'], ...
					['BRAPH2' ':StringCombine:' 'WrongInput' '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' StringCombine.getPropTag(prop) ' (' StringCombine.getFormatTag(StringCombine.getPropFormat(prop)) ').'] ...
					)
			end
		end
	end
	methods (Access=protected) % calculate value
		function value = calculateValue(sc, prop, varargin)
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
				case 11 % StringCombine.S_COMBINED
					rng_settings_ = rng(); rng(sc.getPropSeed(11), 'twister')
					
					value = [sc.get('SU1').get('S') ' ' sc.get('SU2').get('S')];
					
					rng(rng_settings_)
					
				otherwise
					if prop <= 8
						value = calculateValue@ConcreteElement(sc, prop, varargin{:});
					else
						value = calculateValue@Element(sc, prop, varargin{:});
					end
			end
			
		end
	end
end
