# Error for undefined sections in yaml file
class Monet::UndefinedSectionError    < StandardError; end
# Error for undefined references in yaml file
class Monet::UndefinedReferenceError  < StandardError; end
# Error for invalid references in yaml file
class Monet::InvalidReferenceError    < StandardError; end
# Error for circular references in yaml file
class Monet::CircularReferenceError   < StandardError; end
# Error for syntax issues in yaml file
class Monet::SyntaxError              < StandardError; end
