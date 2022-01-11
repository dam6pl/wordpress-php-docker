# WordPress PHP 8.1 docker image

WordPress PHP 8.1 docker image extends by xDebug and Blackfire extensions.

Docker image for increase development experience allows the use xDebug and Blackfire extensions for increase performance and better debugging.

As an extra feature [Symfony VarDumper component](https://symfony.com/doc/current/components/var_dumper.html) is also available in this image.

## How to enable xDebug extension?

xDebug extension can be enabled by adding the followed key in the `environment` section:

```yml
ENABLE_XDEBUG: 1
```

## How to enable BlackFire extension?

Blackfire extension, like xDebug, can be enabled by adding the followed key in the `environment` section:

```yml
ENABLE_BLACKFIRE: 1
```

Also, the extension required to load [the official Blackfire image](https://hub.docker.com/r/blackfire/blackfire).

## Rest of configuration fields

The rest of the configuration explanations are available on [the official image page on Docker HUB](https://hub.docker.com/_/wordpress/).

## License

View [license information](https://wordpress.org/about/license/) for the software contained in this image.
