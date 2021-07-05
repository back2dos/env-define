package ;

import travix.Logger.*;

class RunTests {

  static function main()
    exit(
      #if env.PATH 0 #else 404 #end
    );

}