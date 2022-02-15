#!/usr/bin/python3
'''A module containing functions for working with the Reddit API.
'''
import re
import requests
from requests.structures import CaseInsensitiveDict


BASE_URL = 'https://www.reddit.com'
'''Reddit's base API URL.
'''


def count_words(subreddit, word_list, histogram={}, n=0, after=None):
    '''
    '''
    api_headers = {
        'Accept': 'application/json',
        'User-Agent': ' '.join([
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64)',
            'AppleWebKit/537.36 (KHTML, like Gecko)',
            'Chrome/97.0.4692.71',
            'Safari/537.36',
            'Edg/97.0.1072.62'
        ])
    }
    sort = 'hot'
    limit = 30
    res = requests.get(
        '{}/r/{}/.json?sort={}&limit={}&count={}&after={}'.format(
            BASE_URL,
            subreddit,
            sort,
            limit,
            n,
            after if after else ''
        ),
        headers=api_headers,
        allow_redirects=False
    )
    dict2 = CaseInsensitiveDict
    if not histogram:
        histogram = dict2(list(map(lambda x: (x, 0), word_list)))
    if res.status_code == 200:
        data = res.json()['data']
        posts = data['children']
        titles = list(map(lambda x: x['data']['title'], posts))
        histogram = dict2(map(
            lambda x: x[1] + sum(map(
                lambda txt: len(
                    re.findall(
                        '\s{}\s'.format(x[0]),
                        ' {} '.format(txt.replace(' ', '  ')),
                        re.IGNORECASE
                    )),
                titles
            )),
            histogram.items()
        ))
        if len(posts) >= limit and data['after']:
            return count_words(
                subreddit,
                histogram,
                n + len(posts),
                data['after']
            )
        else:
            if not histogram:
                return None
            histogram_items = histogram.items()
            histogram_items.sort(
                key=lambda x: x[0],
                reverse=True
            )
            histogram_items.sort(
                key=lambda x: x[1],
                reverse=True
            )
            histogram = dict(histogram_items)
            res_str = '\n'.join(
                map(
                    lambda x: '{}: {}'.format(x[0].lower(), x[1]),
                    histogram.items()
                )
            )
            print(res_str)
            return histogram
    else:
        if not histogram:
            return None
        histogram_items = histogram.items()
        histogram_items.sort(
            key=lambda x: x[0],
            reverse=True
        )
        histogram_items.sort(
            key=lambda x: x[1],
            reverse=True
        )
        histogram = dict(histogram_items)
        res_str = '\n'.join(
            map(
                lambda x: '{}: {}'.format(x[0].lower(), x[1]),
                histogram.items()
            )
        )
        print(res_str)
        return histogram
