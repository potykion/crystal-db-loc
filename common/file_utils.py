import json


def from_json(path):
    with open(path) as f:
        return json.load(f)
