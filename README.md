Docker Java
===========

Docker Image packaging for SBT, built on [my Oracle Java image][1]. Available on the [Docker Hub][2].

Usage
-----

The following environment variables are available to allow you to configure how the container will run, and various options within it:

* **SBT_UID**: Allows you to configure the UID of the `sbt` user within the container. This is set via the container entrypoint. (Default: 1000)
* **SBT_GID**: Allows you to configure the GID of the `sbt` user within the container. This is set via the container entrypoint. (Default: 1000)
* **SBT_HOME**: Allows you to configure the home directory of the `sbt` user within the container. (Default: /home/sbt)
* **SBT_WORKDIR**: This will specify the directory that the `CMD` will be executed in. This is set via the container `ENTRYPOINT`. (Default: /app)

If you want to take advantage of the ivy cache, you can run it like this:

```
$ docker run -v `pwd`/.ivy2:/home/sbt/.ivy2 seeruk/sbt:<tag> <cmd>
```

License
-------

MIT

Contributing
------------

Feel free to open a [pull request][3], or file an [issue][4] on Github. I always welcome contributions as long as they're for the benefit of all (potential) users of this image.

If you're unsure about anything, feel free to ask about it in an issue before you get your heart set on fixing it yourself.

[1]: https://hub.docker.com/r/seeruk/java/
[2]: https://hub.docker.com/r/seeruk/sbt/
[3]: https://github.com/SeerUK/docker-sbt/pulls
[4]: https://github.com/SeerUK/docker-sbt/issues
