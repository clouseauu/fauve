# Error for undefined sections in yaml file
class Fauve::UndefinedSectionError    < StandardError; end
# Error for undefined references in yaml file
class Fauve::UndefinedReferenceError  < StandardError; end
# Error for invalid references in yaml file
class Fauve::InvalidReferenceError    < StandardError; end
# Error for circular references in yaml file
class Fauve::CircularReferenceError   < StandardError; end
# Error for syntax issues in yaml file
class Fauve::SyntaxError              < StandardError; end
