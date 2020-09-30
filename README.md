# WordPress PHP 7.4 docker image

WordPress PHP 7.4 docker image extends by xDebug and BlackFire extensions.

Docker image for increase development experience, allows use xDebug and BlackFire extensions for increase performance and better debugging.

As an extra feature [Symfony VarDumper component](https://symfony.com/doc/current/components/var_dumper.html) is also available in this image.

## How to enable xDebug extension?

xDebug extension can be enabled by adding followed key in the `environment` section:

```yml
ENABLE_XDEBUG: 1
```

## How to enable BlackFire extension?

BlackFire extension, like xDebug, can be enabled by adding followed key in the `environment` section:

```yml
ENABLE_BLACKFIRE: 1
```

## Rest of configuration fields

Rest of configuration explanations are available in the [official image page on Docker HUB](https://hub.docker.com/_/wordpress/).

## License

View [license information](https://wordpress.org/about/license/) for the software contained in this image.
