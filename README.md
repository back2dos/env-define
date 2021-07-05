# env-define

Use environment variables as compiler defines.

Adding this library to your build will turn all available environment variables into compiler defines prefixed with `env.*`.

You can then use them like so:

```haxe
#if env.CI
  doSomethingSpecific();
#end

#if (env.NODE_ENV == "production")
  trace('seems like this is a production build');
#end
```

## Downsides

Ideally, functionality like this would come directly from the compiler, but for the time being this library can do the trick with certain limitations:

1. Be sure to list `-lib env-define` as far ahead in your build args as possible. This library uses init macros to add defines and if this happens after typing started, things can go quite horribly wrong, e.g.: https://github.com/HaxeFoundation/haxe/issues/8368
2. The defines will not be availble in macro context
3. Depending on how many environment vars you have, you may find yourself burried in env defines. When printing `haxe.macro.Context.getDefines()` you'll probably want to filter out keys having the prefix.