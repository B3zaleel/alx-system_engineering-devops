#!/usr/bin/python3
'''A module containing functions for working with the Reddit API.
'''
import re
import requests


BASE_URL = 'https://www.reddit.com'
'''Reddit's base API URL.
'''


def sort_histogram(histogram={}):
    '''Sorts and prints the given histogram.
    '''
    histogram = dict(list(filter(lambda kv: kv[1], histogram.items())))
    keys_all = list(map(lambda k: k.lower(), histogram.keys()))
    histogram_aggregate = dict(list(map(
        lambda k: (k, histogram[k] * keys_all.count(k)),
        set(keys_all)
    )))
    histogram_items = list(histogram_aggregate.items())
    histogram_items.sort(
        key=lambda kv: kv[0],
        reverse=False
    )
    histogram_items.sort(
        key=lambda kv: kv[1],
        reverse=True
    )
    res_str = '\n'.join(list(map(
        lambda kv: '{}: {}'.format(kv[0], kv[1]),
        histogram_items
    )))
    if res_str:
        print(res_str)


def count_words(subreddit, word_list, histogram={}, n=0, after=None):
    '''Counts the number of times each word in a given wordlist
    occurs in a given subreddit.
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
    if not histogram:
        histogram = dict(map(lambda word: (word, 0), word_list))
    if res.status_code == 200:
        data = res.json()['data']
        posts = data['children']
        titles = list(map(lambda post: post['data']['title'], posts))
        histogram = dict(list(map(
            lambda kv: (kv[0], kv[1] + sum(list(map(
                lambda txt: len(
                    re.findall(
                        r'\s{}\s'.format(re.escape(kv[0])),
                        ' {} '.format(txt.replace(' ', '  ')),
                        re.IGNORECASE
                    )),
                titles
            )))),
            histogram.items()
        )))
        if len(posts) >= limit and data['after']:
            count_words(
                subreddit,
                word_list,
                histogram,
                n + len(posts),
                data['after']
            )
        else:
            if not histogram:
                return
            sort_histogram(histogram)
    else:
        if not histogram:
            return
        sort_histogram(histogram)
