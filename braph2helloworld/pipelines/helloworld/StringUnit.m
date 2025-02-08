classdef StringUnit < ConcreteElement
	%StringUnit contains a user-defined string.
	% It is a subclass of <a href="matlab:help ConcreteElement">ConcreteElement</a>.
	%
	% A String Unit (StringUnit) contains a user-defined string. 
	% This element is created for distribution demonstration purpose.
	%
	% The list of StringUnit properties is:
	%  <strong>1</strong> <strong>ELCLASS</strong> 	ELCLASS (constant, string) is the class of the string unit.
	%  <strong>2</strong> <strong>NAME</strong> 	NAME (constant, string) is the name of the string unit.
	%  <strong>3</strong> <strong>DESCRIPTION</strong> 	DESCRIPTION (constant, string) is the description of the string unit.
	%  <strong>4</strong> <strong>TEMPLATE</strong> 	TEMPLATE (parameter, item) is the template of the string unit.
	%  <strong>5</strong> <strong>ID</strong> 	ID (data, string) is a few-letter code for the string unit.
	%  <strong>6</strong> <strong>LABEL</strong> 	LABEL (metadata, string) is an extended label of the string unit.
	%  <strong>7</strong> <strong>NOTES</strong> 	NOTES (metadata, string) are some specific notes about the string unit.
	%  <strong>8</strong> <strong>TOSTRING</strong> 	TOSTRING (query, string) returns a string that represents the concrete element.
	%  <strong>9</strong> <strong>S</strong> 	S (data, string) is the user-defined string.
	%
	% StringUnit methods (constructor):
	%  StringUnit - constructor
	%
	% StringUnit methods:
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
	% StringUnit methods (display):
	%  tostring - string with information about the string
	%  disp - displays information about the string
	%  tree - displays the tree of the string
	%
	% StringUnit methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two string are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the string
	%
	% StringUnit methods (save/load, Static):
	%  save - saves BRAPH2 string as b2 file
	%  load - loads a BRAPH2 string from a b2 file
	%
	% StringUnit method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the string
	%
	% StringUnit method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the string
	%
	% StringUnit methods (inspection, Static):
	%  getClass - returns the class of the string
	%  getSubclasses - returns all subclasses of StringUnit
	%  getProps - returns the property list of the string
	%  getPropNumber - returns the property number of the string
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
	% StringUnit methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% StringUnit methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% StringUnit methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% StringUnit methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?StringUnit; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">StringUnit constants</a>.
	%
	%
	% See also StringCombine, PanelPropString.
	%
	% BUILD BRAPH2 6 class_name 1
	
	properties (Constant) % properties
		S = 9; %CET: Computational Efficiency Trick
		S_TAG = 'S';
		S_CATEGORY = 4;
		S_FORMAT = 2;
	end
	methods % constructor
		function s = StringUnit(varargin)
			%StringUnit() creates a string.
			%
			% StringUnit(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% StringUnit(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			% The list of StringUnit properties is:
			%  <strong>1</strong> <strong>ELCLASS</strong> 	ELCLASS (constant, string) is the class of the string unit.
			%  <strong>2</strong> <strong>NAME</strong> 	NAME (constant, string) is the name of the string unit.
			%  <strong>3</strong> <strong>DESCRIPTION</strong> 	DESCRIPTION (constant, string) is the description of the string unit.
			%  <strong>4</strong> <strong>TEMPLATE</strong> 	TEMPLATE (parameter, item) is the template of the string unit.
			%  <strong>5</strong> <strong>ID</strong> 	ID (data, string) is a few-letter code for the string unit.
			%  <strong>6</strong> <strong>LABEL</strong> 	LABEL (metadata, string) is an extended label of the string unit.
			%  <strong>7</strong> <strong>NOTES</strong> 	NOTES (metadata, string) are some specific notes about the string unit.
			%  <strong>8</strong> <strong>TOSTRING</strong> 	TOSTRING (query, string) returns a string that represents the concrete element.
			%  <strong>9</strong> <strong>S</strong> 	S (data, string) is the user-defined string.
			%
			% See also Category, Format.
			
			s = s@ConcreteElement(varargin{:});
		end
	end
	methods (Static) % inspection
		function build = getBuild()
			%GETBUILD returns the build of the string.
			%
			% BUILD = StringUnit.GETBUILD() returns the build of 'StringUnit'.
			%
			% Alternative forms to call this method are:
			%  BUILD = S.GETBUILD() returns the build of the string S.
			%  BUILD = Element.GETBUILD(S) returns the build of 'S'.
			%  BUILD = Element.GETBUILD('StringUnit') returns the build of 'StringUnit'.
			%
			% Note that the Element.GETBUILD(S) and Element.GETBUILD('StringUnit')
			%  are less computationally efficient.
			
			build = 1;
		end
		function s_class = getClass()
			%GETCLASS returns the class of the string.
			%
			% CLASS = StringUnit.GETCLASS() returns the class 'StringUnit'.
			%
			% Alternative forms to call this method are:
			%  CLASS = S.GETCLASS() returns the class of the string S.
			%  CLASS = Element.GETCLASS(S) returns the class of 'S'.
			%  CLASS = Element.GETCLASS('StringUnit') returns 'StringUnit'.
			%
			% Note that the Element.GETCLASS(S) and Element.GETCLASS('StringUnit')
			%  are less computationally efficient.
			
			s_class = 'StringUnit';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the string.
			%
			% LIST = StringUnit.GETSUBCLASSES() returns all subclasses of 'StringUnit'.
			%
			% Alternative forms to call this method are:
			%  LIST = S.GETSUBCLASSES() returns all subclasses of the string S.
			%  LIST = Element.GETSUBCLASSES(S) returns all subclasses of 'S'.
			%  LIST = Element.GETSUBCLASSES('StringUnit') returns all subclasses of 'StringUnit'.
			%
			% Note that the Element.GETSUBCLASSES(S) and Element.GETSUBCLASSES('StringUnit')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = { 'StringUnit' }; %CET: Computational Efficiency Trick
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of string.
			%
			% PROPS = StringUnit.GETPROPS() returns the property list of string
			%  as a row vector.
			%
			% PROPS = StringUnit.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = S.GETPROPS([CATEGORY]) returns the property list of the string S.
			%  PROPS = Element.GETPROPS(S[, CATEGORY]) returns the property list of 'S'.
			%  PROPS = Element.GETPROPS('StringUnit'[, CATEGORY]) returns the property list of 'StringUnit'.
			%
			% Note that the Element.GETPROPS(S) and Element.GETPROPS('StringUnit')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			%CET: Computational Efficiency Trick
			
			if nargin == 0
				prop_list = [1 2 3 4 5 6 7 8 9];
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
					prop_list = [5 9];
				case 6 % Category.QUERY
					prop_list = 8;
				otherwise
					prop_list = [];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of string.
			%
			% N = StringUnit.GETPROPNUMBER() returns the property number of string.
			%
			% N = StringUnit.GETPROPNUMBER(CATEGORY) returns the property number of string
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = S.GETPROPNUMBER([CATEGORY]) returns the property number of the string S.
			%  N = Element.GETPROPNUMBER(S) returns the property number of 'S'.
			%  N = Element.GETPROPNUMBER('StringUnit') returns the property number of 'StringUnit'.
			%
			% Note that the Element.GETPROPNUMBER(S) and Element.GETPROPNUMBER('StringUnit')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			%CET: Computational Efficiency Trick
			
			if nargin == 0
				prop_number = 9;
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
					prop_number = 2;
				case 6 % Category.QUERY
					prop_number = 1;
				otherwise
					prop_number = 0;
			end
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in string/error.
			%
			% CHECK = StringUnit.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = S.EXISTSPROP(PROP) checks whether PROP exists for S.
			%  CHECK = Element.EXISTSPROP(S, PROP) checks whether PROP exists for S.
			%  CHECK = Element.EXISTSPROP(StringUnit, PROP) checks whether PROP exists for StringUnit.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:StringUnit:WrongInput]
			%
			% Alternative forms to call this method are:
			%  S.EXISTSPROP(PROP) throws error if PROP does NOT exist for S.
			%   Error id: [BRAPH2:StringUnit:WrongInput]
			%  Element.EXISTSPROP(S, PROP) throws error if PROP does NOT exist for S.
			%   Error id: [BRAPH2:StringUnit:WrongInput]
			%  Element.EXISTSPROP(StringUnit, PROP) throws error if PROP does NOT exist for StringUnit.
			%   Error id: [BRAPH2:StringUnit:WrongInput]
			%
			% Note that the Element.EXISTSPROP(S) and Element.EXISTSPROP('StringUnit')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = prop >= 1 && prop <= 9 && round(prop) == prop; %CET: Computational Efficiency Trick
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					['BRAPH2' ':StringUnit:' 'WrongInput'], ...
					['BRAPH2' ':StringUnit:' 'WrongInput' '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for StringUnit.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in string/error.
			%
			% CHECK = StringUnit.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = S.EXISTSTAG(TAG) checks whether TAG exists for S.
			%  CHECK = Element.EXISTSTAG(S, TAG) checks whether TAG exists for S.
			%  CHECK = Element.EXISTSTAG(StringUnit, TAG) checks whether TAG exists for StringUnit.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:StringUnit:WrongInput]
			%
			% Alternative forms to call this method are:
			%  S.EXISTSTAG(TAG) throws error if TAG does NOT exist for S.
			%   Error id: [BRAPH2:StringUnit:WrongInput]
			%  Element.EXISTSTAG(S, TAG) throws error if TAG does NOT exist for S.
			%   Error id: [BRAPH2:StringUnit:WrongInput]
			%  Element.EXISTSTAG(StringUnit, TAG) throws error if TAG does NOT exist for StringUnit.
			%   Error id: [BRAPH2:StringUnit:WrongInput]
			%
			% Note that the Element.EXISTSTAG(S) and Element.EXISTSTAG('StringUnit')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(strcmp(tag, { 'ELCLASS'  'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'S' })); %CET: Computational Efficiency Trick
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					['BRAPH2' ':StringUnit:' 'WrongInput'], ...
					['BRAPH2' ':StringUnit:' 'WrongInput' '\n' ...
					'The value ' tag ' is not a valid tag for StringUnit.'] ...
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
			%  PROPERTY = S.GETPROPPROP(POINTER) returns property number of POINTER of S.
			%  PROPERTY = Element.GETPROPPROP(StringUnit, POINTER) returns property number of POINTER of StringUnit.
			%  PROPERTY = S.GETPROPPROP(StringUnit, POINTER) returns property number of POINTER of StringUnit.
			%
			% Note that the Element.GETPROPPROP(S) and Element.GETPROPPROP('StringUnit')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				prop = find(strcmp(pointer, { 'ELCLASS'  'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'S' })); % tag = pointer %CET: Computational Efficiency Trick
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
			%  TAG = S.GETPROPTAG(POINTER) returns tag of POINTER of S.
			%  TAG = Element.GETPROPTAG(StringUnit, POINTER) returns tag of POINTER of StringUnit.
			%  TAG = S.GETPROPTAG(StringUnit, POINTER) returns tag of POINTER of StringUnit.
			%
			% Note that the Element.GETPROPTAG(S) and Element.GETPROPTAG('StringUnit')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropSettings, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			if ischar(pointer)
				tag = pointer;
			else % numeric
				%CET: Computational Efficiency Trick
				stringunit_tag_list = { 'ELCLASS'  'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'S' };
				tag = stringunit_tag_list{pointer}; % prop = pointer
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
			%  CATEGORY = S.GETPROPCATEGORY(POINTER) returns category of POINTER of S.
			%  CATEGORY = Element.GETPROPCATEGORY(StringUnit, POINTER) returns category of POINTER of StringUnit.
			%  CATEGORY = S.GETPROPCATEGORY(StringUnit, POINTER) returns category of POINTER of StringUnit.
			%
			% Note that the Element.GETPROPCATEGORY(S) and Element.GETPROPCATEGORY('StringUnit')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = StringUnit.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			stringunit_category_list = { 1  1  1  3  4  2  2  6  4 };
			prop_category = stringunit_category_list{prop};
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
			%  FORMAT = S.GETPROPFORMAT(POINTER) returns format of POINTER of S.
			%  FORMAT = Element.GETPROPFORMAT(StringUnit, POINTER) returns format of POINTER of StringUnit.
			%  FORMAT = S.GETPROPFORMAT(StringUnit, POINTER) returns format of POINTER of StringUnit.
			%
			% Note that the Element.GETPROPFORMAT(S) and Element.GETPROPFORMAT('StringUnit')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = StringUnit.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			stringunit_format_list = { 2  2  2  8  2  2  2  2  2 };
			prop_format = stringunit_format_list{prop};
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
			%  DESCRIPTION = S.GETPROPDESCRIPTION(POINTER) returns description of POINTER of S.
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(StringUnit, POINTER) returns description of POINTER of StringUnit.
			%  DESCRIPTION = S.GETPROPDESCRIPTION(StringUnit, POINTER) returns description of POINTER of StringUnit.
			%
			% Note that the Element.GETPROPDESCRIPTION(S) and Element.GETPROPDESCRIPTION('StringUnit')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = StringUnit.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			stringunit_description_list = { 'ELCLASS (constant, string) is the class of the string unit.'  'NAME (constant, string) is the name of the string unit.'  'DESCRIPTION (constant, string) is the description of the string unit.'  'TEMPLATE (parameter, item) is the template of the string unit.'  'ID (data, string) is a few-letter code for the string unit.'  'LABEL (metadata, string) is an extended label of the string unit.'  'NOTES (metadata, string) are some specific notes about the string unit.'  'TOSTRING (query, string) returns a string that represents the concrete element.'  'S (data, string) is the user-defined string.' };
			prop_description = stringunit_description_list{prop};
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
			%  SETTINGS = S.GETPROPSETTINGS(POINTER) returns settings of POINTER of S.
			%  SETTINGS = Element.GETPROPSETTINGS(StringUnit, POINTER) returns settings of POINTER of StringUnit.
			%  SETTINGS = S.GETPROPSETTINGS(StringUnit, POINTER) returns settings of POINTER of StringUnit.
			%
			% Note that the Element.GETPROPSETTINGS(S) and Element.GETPROPSETTINGS('StringUnit')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = StringUnit.getPropProp(pointer);
			
			switch prop %CET: Computational Efficiency Trick
				case StringUnit.S % __StringUnit.S__
					prop_settings = Format.getFormatSettings(2);
				case StringUnit.TEMPLATE % __StringUnit.TEMPLATE__
					prop_settings = 'StringUnit';
				otherwise
					prop_settings = getPropSettings@ConcreteElement(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = StringUnit.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = StringUnit.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = S.GETPROPDEFAULT(POINTER) returns the default value of POINTER of S.
			%  DEFAULT = Element.GETPROPDEFAULT(StringUnit, POINTER) returns the default value of POINTER of StringUnit.
			%  DEFAULT = S.GETPROPDEFAULT(StringUnit, POINTER) returns the default value of POINTER of StringUnit.
			%
			% Note that the Element.GETPROPDEFAULT(S) and Element.GETPROPDEFAULT('StringUnit')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = StringUnit.getPropProp(pointer);
			
			switch prop %CET: Computational Efficiency Trick
				case StringUnit.S % __StringUnit.S__
					prop_default = 'Hello';
				case StringUnit.ELCLASS % __StringUnit.ELCLASS__
					prop_default = 'StringUnit';
				case StringUnit.NAME % __StringUnit.NAME__
					prop_default = 'String Unit';
				case StringUnit.DESCRIPTION % __StringUnit.DESCRIPTION__
					prop_default = 'A String Unit (StringUnit) contains a user-defined string. This element is created for distribution demonstration purpose.';
				case StringUnit.TEMPLATE % __StringUnit.TEMPLATE__
					prop_default = Format.getFormatDefault(8, StringUnit.getPropSettings(prop));
				case StringUnit.ID % __StringUnit.ID__
					prop_default = 'StringUnit ID';
				case StringUnit.LABEL % __StringUnit.LABEL__
					prop_default = 'StringUnit label';
				case StringUnit.NOTES % __StringUnit.NOTES__
					prop_default = 'StringUnit notes';
				otherwise
					prop_default = getPropDefault@ConcreteElement(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = StringUnit.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = StringUnit.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = S.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of S.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(StringUnit, POINTER) returns the conditioned default value of POINTER of StringUnit.
			%  DEFAULT = S.GETPROPDEFAULTCONDITIONED(StringUnit, POINTER) returns the conditioned default value of POINTER of StringUnit.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(S) and Element.GETPROPDEFAULTCONDITIONED('StringUnit')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = StringUnit.getPropProp(pointer);
			
			prop_default = StringUnit.conditioning(prop, StringUnit.getPropDefault(prop));
		end
	end
	methods (Static) % checkProp
		function prop_check = checkProp(pointer, value)
			%CHECKPROP checks whether a value has the correct format/error.
			%
			% CHECK = S.CHECKPROP(POINTER, VALUE) checks whether
			%  VALUE is an acceptable value for the format of the property
			%  POINTER (POINTER = PROP or TAG).
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  CHECK = S.CHECKPROP(POINTER, VALUE) checks VALUE format for PROP of S.
			%  CHECK = Element.CHECKPROP(StringUnit, PROP, VALUE) checks VALUE format for PROP of StringUnit.
			%  CHECK = S.CHECKPROP(StringUnit, PROP, VALUE) checks VALUE format for PROP of StringUnit.
			% 
			% S.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: BRAPH2:StringUnit:WrongInput
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  S.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of S.
			%   Error id: BRAPH2:StringUnit:WrongInput
			%  Element.CHECKPROP(StringUnit, PROP, VALUE) throws error if VALUE has not a valid format for PROP of StringUnit.
			%   Error id: BRAPH2:StringUnit:WrongInput
			%  S.CHECKPROP(StringUnit, PROP, VALUE) throws error if VALUE has not a valid format for PROP of StringUnit.
			%   Error id: BRAPH2:StringUnit:WrongInput]
			% 
			% Note that the Element.CHECKPROP(S) and Element.CHECKPROP('StringUnit')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = StringUnit.getPropProp(pointer);
			
			switch prop
				case StringUnit.S % __StringUnit.S__
					check = Format.checkFormat(2, value, StringUnit.getPropSettings(prop));
				case StringUnit.TEMPLATE % __StringUnit.TEMPLATE__
					check = Format.checkFormat(8, value, StringUnit.getPropSettings(prop));
				otherwise
					if prop <= ConcreteElement.getPropNumber()
						check = checkProp@ConcreteElement(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					['BRAPH2' ':StringUnit:' 'WrongInput'], ...
					['BRAPH2' ':StringUnit:' 'WrongInput' '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' StringUnit.getPropTag(prop) ' (' StringUnit.getFormatTag(StringUnit.getPropFormat(prop)) ').'] ...
					)
			end
		end
	end
end
