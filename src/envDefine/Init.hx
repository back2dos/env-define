package envDefine;

#if macro
@:noCompletion
class Init {
  static function env() {
    for (k => v in Sys.environment())
      haxe.macro.Compiler.define('env.$k', v);

    haxe.macro.Compiler.define('env.os.${Sys.systemName().toLowerCase()}');
  }
}
#end
