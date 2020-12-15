#!/usr/bin/env python3

import logging
from argparse import ArgumentParser

LOG_FMT_STR = "%(asctime)s %(name)s [%(levelname)s] %(message)s"
log = logging.getLogger(__name__)


def foo(the_thing):
    # f-strings are similar to printf
    output = f"biscuits and {the_thing}"
    log.info(output)
    # or
    print(output)


def main(args):

    # Configure and enable logging with a root logger
    logging.basicConfig(format=LOG_FMT_STR, level=logging.DEBUG)

    # Note python hates hyphens, so argparse converts it to an underscore
    foo(args.some_param)


if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument(
        "--some-param", type=str, default=None, help="Some helpful stuff here.."
    )
    main(parser.parse_args())
