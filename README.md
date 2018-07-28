# Set up an Auditor User encrypted using Keybase

Can be used to generate users for [neo-infra](https://gogs.mague.com/Shokunin/neo-infra) or various other Amazon auditing software

## prereqs

- [aws cli](https://docs.aws.amazon.com/cli/latest/userguide/installing.html)
- [tfenv](https://docs.aws.amazon.com/cli/latest/userguide/installing.html)
- Optional: for decryption only [keybase](https://keybase.io)


## using

```
# ensure we have the proper version of terraform installed
$ tfenv install `cat .terraform-version`

# initialize terraform
$ terraform init

# setup the audit user
$ terraform apply 
var.keybase-user
  Enter a value: maguec

var.profile
  Enter a value: myprofile

var.region
  Enter a value: us-west-1
```

## sharing output

Take the terraform run output:

```
Outputs:

auditor-id = AKITAI5YPIZZAV8L9A
auditor-secret = 
-----BEGIN PGP MESSAGE-----

wcFMA1cIW82KGoQBARAAjHClizQGbFUwBBCuaUs+vjmRUGBR8PjIsZz/rAsyW9Vx+g6qfJsI2s2BURG6xjI7RbjPgeHNoOOWavw7KFczdzcplR3BalQFV2kKSGMdHs8RzO9p8ObN88ObvOUxWb/6BMUOH9DZRlko2Lz6OAXF9ZRPazUl/+zwwvuOKoF1GDBlOCCpKzwCWP5e1XBf2uV6sNTjOZUh5/19s6jcOU8SRhuRkAcWSnL6y1hgs6WBaR3veuFRdTykV1uImnTP8fRBSUeczRXOsaUhRycGsIRk9uzJqxxd59zOrc9b9oPFy2OoyWgZSRQduyFdFKcgFRO53namNeLlnbGxXLGn3zCkZFkVf/19zF3bZeC6e2HqfUJUUMbM/zKDVGevzM1n/N6huhFh9ZbPvVLArzDR7W8wgj1xjRlWOoz2aUqf2XrrPz/QRZsapZPTcFp8dKR1LX8lTvTgHUaZCG99iuRuBGa+H/jxR3GUWkNpbDuaaJ+6NBBzCmbQ67kcoTdsD1NzyQbqZLA9irgzs7A+Jg9AqRjTgOURdFpC6Rlz+NJoJOnR/ZXz9j8AHfIMr82Xw91ppUgPKnL+fZ+fgTTBhqrQBsxfvz/JmUrDUWsZLWIZV9fgIz2Z88fNRvP8W3oy+SnlRPsHzRqGFh5huxRdzPAVWkHeyIRfbR5U/vAFvqPVxXrCiZnS8AHkUqB36jzJIh8Vq58WrwwLiuHU9uDm8O7hLr3g5+IpNCCZ8DDlwKLhGaSiivLXMQVFAFeUJcOkUn2+7JBR89ORPeFR2Ang7+NkFx9zLieOAuDh5DNZUXGiVRSnyc/pcuVJIqziz5SNjeFuuwA=
-----END PGP MESSAGE-----
```

and send the the keybase user that you encrypted to

## decrypting output

copy the auditor secret to a file called /tmp/a

```
$ keybase pgp decrypt -i /tmp/a
k0OksL+0OD9/dropinQAw7wDMYoUw3D6vc5hUzgWave
```
