Feature: Github

Scenario: Parsing `github.raml`
  When I parse the fixture file "github.raml"
  Then I inspect the root object
  And it has these properties
    | title      | GitHub API             |
    | version    | v3                     |
    | base_uri   | https://api.github.com |
    | media_type | application/json       |
  Then I inspect the item "oauth_2_0" of "security_schemes" collection
  And it has these properties
    | type     | OAuth 2.0              |
  And it has this description
    """
    OAuth2 is a protocol that lets external apps request authorization to private
    details in a user's GitHub account without getting their password. This is
    preferred over Basic Authentication because tokens can be limited to specific
    types of data, and can be revoked by users at any time.

    """
  Then I inspect the property "described_by"
  Then I inspect the item "Authorization" of "headers" collection
  And it has this description
    """
    Used to send a valid OAuth 2 access token. Do not use together with
    the "access_token" query string parameter.

    """
    And it has these properties
      | type | string |
  Then I inspect the parent object
  Then I inspect the item "access_token" of "query_parameters" collection
  And it has this description
    """
    Used to send a valid OAuth 2 access token. Do not use together with
    the "Authorization" header

    """
  And it has these properties
    | type | string |
  Then I inspect the parent object
  And I inspect the item "404" of "responses" collection
  And it has these properties
    | description | Unauthorized |
  Then I inspect the parent object
  Then I inspect the parent object
  Then I inspect the property "settings"
  And it has these properties
    | authorization_uri | https://github.com/login/oauth/authorize |
    | access_token_uri  | https://github.com/login/oauth/access_token |
  And the value of the property "authorization_grants" is an array of
    | code |
  And the value of the property "scopes" is an array of
    | user |
    | user:email |
    | user:follow |
    | public_repo |
    | repo |
    | repo:status |
    | delete_repo |
    | notifications |
    | gist |
  Then I inspect the root object
  Then I inspect the item "base" of "resource_types" collection
  Then I inspect the item "get?" of "methods" collection
  Then I inspect the item "X-GitHub-Media-Type" of "headers" collection
  And it has these properties
    | type | string |
  And it has this description
  """
  You can check the current version of media type in responses.

  """
  Then I inspect the parent object
  Then I inspect the item "Accept" of "headers" collection
  And it has these properties
    | description | Is used to set specified media type. |
    | type        | string                               |
  Then I inspect the parent object
  Then I inspect the item "X-RateLimit-Limit" of "headers" collection
  And it has these properties
    | type        | integer |
  Then I inspect the parent object
  Then I inspect the item "X-RateLimit-Remaining" of "headers" collection
  And it has these properties
    | type        | integer |
  Then I inspect the parent object
  Then I inspect the item "X-RateLimit-Reset" of "headers" collection
  And it has these properties
    | type        | integer |
  Then I inspect the parent object
  Then I inspect the item "X-GitHub-Request-Id" of "headers" collection
  And it has these properties
    | type        | integer |
  Then I inspect the parent object
  Then I inspect the item "403" of "responses" collection
  And it has this description
  """
  API rate limit exceeded. See http://developer.github.com/v3/#rate-limiting
  for details.

  """
  Then I inspect the parent object
  Then I inspect the parent object
  Then I inspect the item "post?" of "methods" collection
  Then I inspect the item "X-GitHub-Media-Type" of "headers" collection
  And it has these properties
    | type | string |
  And it has this description
  """
  You can check the current version of media type in responses.

  """
  Then I inspect the parent object
  Then I inspect the item "Accept" of "headers" collection
  And it has these properties
    | description | Is used to set specified media type. |
    | type        | string                               |
  Then I inspect the parent object
  Then I inspect the item "X-RateLimit-Limit" of "headers" collection
  And it has these properties
    | type        | integer |
  Then I inspect the parent object
  Then I inspect the item "X-RateLimit-Remaining" of "headers" collection
  And it has these properties
    | type        | integer |
  Then I inspect the parent object
  Then I inspect the item "X-RateLimit-Reset" of "headers" collection
  And it has these properties
    | type        | integer |
  Then I inspect the parent object
  Then I inspect the item "X-GitHub-Request-Id" of "headers" collection
  And it has these properties
    | type        | integer |
  Then I inspect the parent object
  Then I inspect the item "403" of "responses" collection
  And it has this description
  """
  API rate limit exceeded. See http://developer.github.com/v3/#rate-limiting
  for details.

  """
  Then I inspect the parent object
  Then I inspect the parent object
  Then I inspect the item "patch?" of "methods" collection
  Then I inspect the item "X-GitHub-Media-Type" of "headers" collection
  And it has these properties
    | type | string |
  And it has this description
  """
  You can check the current version of media type in responses.

  """
  Then I inspect the parent object
  Then I inspect the item "Accept" of "headers" collection
  And it has these properties
    | description | Is used to set specified media type. |
    | type        | string                               |
  Then I inspect the parent object
  Then I inspect the item "X-RateLimit-Limit" of "headers" collection
  And it has these properties
    | type        | integer |
  Then I inspect the parent object
  Then I inspect the item "X-RateLimit-Remaining" of "headers" collection
  And it has these properties
    | type        | integer |
  Then I inspect the parent object
  Then I inspect the item "X-RateLimit-Reset" of "headers" collection
  And it has these properties
    | type        | integer |
  Then I inspect the parent object
  Then I inspect the item "X-GitHub-Request-Id" of "headers" collection
  And it has these properties
    | type        | integer |
  Then I inspect the parent object
  Then I inspect the item "403" of "responses" collection
  And it has this description
  """
  API rate limit exceeded. See http://developer.github.com/v3/#rate-limiting
  for details.

  """
  Then I inspect the parent object
  Then I inspect the parent object
  Then I inspect the item "put?" of "methods" collection
  Then I inspect the item "X-GitHub-Media-Type" of "headers" collection
  And it has these properties
    | type | string |
  And it has this description
  """
  You can check the current version of media type in responses.

  """
  Then I inspect the parent object
  Then I inspect the item "Accept" of "headers" collection
  And it has these properties
    | description | Is used to set specified media type. |
    | type        | string                               |
  Then I inspect the parent object
  Then I inspect the item "X-RateLimit-Limit" of "headers" collection
  And it has these properties
    | type        | integer |
  Then I inspect the parent object
  Then I inspect the item "X-RateLimit-Remaining" of "headers" collection
  And it has these properties
    | type        | integer |
  Then I inspect the parent object
  Then I inspect the item "X-RateLimit-Reset" of "headers" collection
  And it has these properties
    | type        | integer |
  Then I inspect the parent object
  Then I inspect the item "X-GitHub-Request-Id" of "headers" collection
  And it has these properties
    | type        | integer |
  Then I inspect the parent object
  Then I inspect the item "403" of "responses" collection
  And it has this description
  """
  API rate limit exceeded. See http://developer.github.com/v3/#rate-limiting
  for details.

  """
  Then I inspect the parent object
  Then I inspect the parent object
  Then I inspect the item "delete?" of "methods" collection
  Then I inspect the item "X-GitHub-Media-Type" of "headers" collection
  And it has these properties
    | type | string |
  And it has this description
  """
  You can check the current version of media type in responses.

  """
  Then I inspect the parent object
  Then I inspect the item "Accept" of "headers" collection
  And it has these properties
    | description | Is used to set specified media type. |
    | type        | string                               |
  Then I inspect the parent object
  Then I inspect the item "X-RateLimit-Limit" of "headers" collection
  And it has these properties
    | type        | integer |
  Then I inspect the parent object
  Then I inspect the item "X-RateLimit-Remaining" of "headers" collection
  And it has these properties
    | type        | integer |
  Then I inspect the parent object
  Then I inspect the item "X-RateLimit-Reset" of "headers" collection
  And it has these properties
    | type        | integer |
  Then I inspect the parent object
  Then I inspect the item "X-GitHub-Request-Id" of "headers" collection
  And it has these properties
    | type        | integer |
  Then I inspect the parent object
  Then I inspect the item "403" of "responses" collection
  And it has this description
  """
  API rate limit exceeded. See http://developer.github.com/v3/#rate-limiting
  for details.

  """
  Then I inspect the root object
  Then I inspect the item "/search" of "resources" collection
  Then I store it as object "/search"
  Then I inspect the item "/repositories" of "resources" collection
  Then I inspect the item "get" of "methods" collection
  And I store it as object "/search-/repositories-GET"
  And it has this description
  """
  Search repositories.
  """
  Then I inspect the item "q" of "query_parameters" collection
  And it has this description
  """
  The search terms. This can be any combination of the supported repository
  search parameters:
  'Search In' Qualifies which fields are searched. With this qualifier you
  can restrict the search to just the repository name, description, readme,
  or any combination of these.
  'Size' Finds repositories that match a certain size (in kilobytes).
  'Forks' Filters repositories based on the number of forks, and/or whether
  forked repositories should be included in the results at all.
  'Created' and 'Last Updated' Filters repositories based on times of
  creation, or when they were last updated.
  'Users or Repositories' Limits searches to a specific user or repository.
  'Languages' Searches repositories based on the language they're written in.
  'Stars' Searches repositories based on the number of stars.

  """
  And it has these properties
    | type     | string |
    | required | true |
  Then I inspect the parent object
  Then I inspect the item "sort" of "query_parameters" collection
  And it has this description
  """
  If not provided, results are sorted by best match.
  """
  And the value of the property "enum" is an array of
    | stars   |
    | forks   |
    | updated |
  Then I inspect the parent object
  Then I inspect the item "order" of "query_parameters" collection
  And it has these properties
    | default | desc |
  And the value of the property "enum" is an array of
    | asc  |
    | desc |
  Then I inspect the object "/search-/repositories-GET"
  Then I inspect the item "X-GitHub-Media-Type" of "headers" collection
  And it has this description
  """
  You can check the current version of media type in responses.

  """
  And it has these properties
    | type | string |
  Then I inspect the object "/search-/repositories-GET"
  Then I inspect the item "Accept" of "headers" collection
  And it has this description
  """
  Is used to set specified media type.
  """
  And it has these properties
    | type | string |
  Then I inspect the object "/search-/repositories-GET"
  Then I inspect the item "X-RateLimit-Limit" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/search-/repositories-GET"
  Then I inspect the item "X-RateLimit-Remaining" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/search-/repositories-GET"
  Then I inspect the item "X-RateLimit-Reset" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/search-/repositories-GET"
  Then I inspect the item "X-GitHub-Request-Id" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/search-/repositories-GET"
  Then I inspect the item "403" of "responses" collection
  And it has this description
  """
  API rate limit exceeded. See http://developer.github.com/v3/#rate-limiting
  for details.

  """
  Then I inspect the object "/search-/repositories-GET"
  Then I inspect the item "200" of "responses" collection
  Then I inspect the item "application/json" of "body" collection
  And it has this "schema"
  """
  {
      "$schema": "http://json-schema.org/draft-03/schema",
      "type": "object",
      "properties": {
          "total_count": {
              "type": "integer"
          },
          "items": [
              {
                  "properties": {
                      "id": {
                          "type": "integer"
                      },
                      "name": {
                          "type": "string"
                      },
                      "full_name": {
                          "type": "string"
                      },
                      "owner": {
                          "properties": {
                              "login": {
                                  "type": "string"
                              },
                              "id": {
                                  "type": "integer"
                              },
                              "avatar_url": {
                                  "type": "string"
                              },
                              "gravatar_id": {
                                  "type": "string"
                              },
                              "url": {
                                  "type": "string"
                              },
                              "received_events_url": {
                                  "type": "string"
                              },
                              "type": {
                                  "type": "string"
                              }
                          },
                          "type": "object"
                      },
                      "private": {
                          "type": "boolean"
                      },
                      "html_url": {
                          "type": "string"
                      },
                      "description": {
                          "type": "string"
                      },
                      "fork": {
                          "type": "boolean"
                      },
                      "url": {
                          "type": "string"
                      },
                      "created_at": {
                          "description": "ISO 8601 format: YYYY-MM-DDTHH:MM:SSZ",
                          "type": "string"
                      },
                      "updated_at": {
                          "description": "ISO 8601 format: YYYY-MM-DDTHH:MM:SSZ",
                          "type": "string"
                      },
                      "pushed_at": {
                          "description": "ISO 8601 format: YYYY-MM-DDTHH:MM:SSZ",
                          "type": "string"
                      },
                      "homepage": {
                          "type": "string"
                      },
                      "size": {
                          "type": "integer"
                      },
                      "watchers_count": {
                          "type": "integer"
                      },
                      "language": {
                          "type": "string"
                      },
                      "forks_count": {
                          "type": "integer"
                      },
                      "open_issues_count": {
                          "type": "integer"
                      },
                      "forks": {
                          "type": "integer"
                      },
                      "open_issues": {
                          "type": "integer"
                      },
                      "watchers": {
                          "type": "integer"
                      },
                      "master_branch": {
                          "type": "string"
                      },
                      "default_branch": {
                          "type": "string"
                      },
                      "score": {
                          "type": "number"
                      }
                  },
                  "type": "object"
              }
          ],
          "type": "array"
      }
  }

  """
  And it has this "example"
  """
  {
    "total_count": 40,
    "items": [
      {
        "id": 3081286,
        "name": "Tetris",
        "full_name": "dtrupenn/Tetris",
        "owner": {
          "login": "dtrupenn",
          "id": 872147,
          "avatar_url": "https://secure.gravatar.com/avatar/e7956084e75f239de85d3a31bc172ace?d=https://a248.e.akamai.net/assets.github.com/images/gravatars/gravatar-user-420.png",
          "gravatar_id": "e7956084e75f239de85d3a31bc172ace",
          "url": "https://api.github.com/users/dtrupenn",
          "received_events_url": "https://api.github.com/users/dtrupenn/received_events",
          "type": "User"
        },
        "private": false,
        "html_url": "https://github.com/dtrupenn/Tetris",
        "description": "A C implementation of Tetris using Pennsim through LC4",
        "fork": false,
        "url": "https://api.github.com/repos/dtrupenn/Tetris",
        "created_at": "2012-01-01T00:31:50Z",
        "updated_at": "2013-01-05T17:58:47Z",
        "pushed_at": "2012-01-01T00:37:02Z",
        "homepage": "",
        "size": 524,
        "watchers_count": 1,
        "language": "Assembly",
        "forks_count": 0,
        "open_issues_count": 0,
        "forks": 0,
        "open_issues": 0,
        "watchers": 1,
        "master_branch": "master",
        "default_branch": "master",
        "score": 10.309712
      }
    ]
  }

  """
  Then I inspect the object "/search"
  Then I inspect the item "/code" of "resources" collection
  Then I inspect the item "get" of "methods" collection
  And I store it as object "/search-/code-GET"
  And it has this description
  """
  Search code.
  """
  Then I inspect the item "q" of "query_parameters" collection
  And it has this description
  """
  The search terms. This can be any combination of the supported code
  search parameters:
  'Search In' Qualifies which fields are searched. With this qualifier
  you can restrict the search to just the file contents, the file path,
  or both.
  'Languages' Searches code based on the language it's written in.
  'Forks' Filters repositories based on the number of forks, and/or
  whether code from forked repositories should be included in the results
  at all.
  'Size' Finds files that match a certain size (in bytes).
  'Path' Specifies the path that the resulting file must be at.
  'Extension' Matches files with a certain extension.
  'Users' or 'Repositories' Limits searches to a specific user or repository.

  """
  And it has these properties
    | type     | string |
    | required | true |
  Then I inspect the parent object
  Then I inspect the item "sort" of "query_parameters" collection
  And it has this description
  """
  Can only be 'indexed', which indicates how recently a file has been indexed
  by the GitHub search infrastructure. If not provided, results are sorted
  by best match.

  """
  And the value of the property "enum" is an array of
    | indexed   |
  Then I inspect the parent object
  Then I inspect the item "order" of "query_parameters" collection
  And it has these properties
    | default | desc |
  And the value of the property "enum" is an array of
    | asc  |
    | desc |
  Then I inspect the object "/search-/code-GET"
  Then I inspect the item "X-GitHub-Media-Type" of "headers" collection
  And it has this description
  """
  You can check the current version of media type in responses.

  """
  And it has these properties
    | type | string |
  Then I inspect the object "/search-/code-GET"
  Then I inspect the item "Accept" of "headers" collection
  And it has this description
  """
  Is used to set specified media type.
  """
  And it has these properties
    | type | string |
  Then I inspect the object "/search-/code-GET"
  Then I inspect the item "X-RateLimit-Limit" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/search-/code-GET"
  Then I inspect the item "X-RateLimit-Remaining" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/search-/code-GET"
  Then I inspect the item "X-RateLimit-Reset" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/search-/code-GET"
  Then I inspect the item "X-GitHub-Request-Id" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/search-/code-GET"
  Then I inspect the item "403" of "responses" collection
  And it has this description
  """
  API rate limit exceeded. See http://developer.github.com/v3/#rate-limiting
  for details.

  """
  Then I inspect the object "/search-/code-GET"
  Then I inspect the item "200" of "responses" collection
  Then I inspect the item "application/json" of "body" collection
  And it has this "schema"
  """
  {
      "$schema": "http://json-schema.org/draft-03/schema",
      "type": "object",
      "properties": {
          "total_count": {
              "type": "integer"
          },
          "items": [
              {
                  "properties": {
                      "name": {
                          "type": "string"
                      },
                      "path": {
                          "type": "string"
                      },
                      "sha": {
                          "type": "string"
                      },
                      "url": {
                          "type": "string"
                      },
                      "git_url": {
                          "type": "string"
                      },
                      "html_url": {
                          "type": "string"
                      },
                      "repository": {
                          "properties": {
                              "id": {
                                  "type": "integer"
                              },
                              "name": {
                                  "type": "string"
                              },
                              "full_name": {
                                  "type": "string"
                              },
                              "owner": {
                                  "properties": {
                                      "login": {
                                          "type": "string"
                                      },
                                      "id": {
                                          "type": "integer"
                                      },
                                      "avatar_url": {
                                          "type": "string"
                                      },
                                      "gravatar_id": {
                                          "type": "string"
                                      },
                                      "url": {
                                          "type": "string"
                                      },
                                      "html_url": {
                                          "type": "string"
                                      },
                                      "followers_url": {
                                          "type": "string"
                                      },
                                      "following_url": {
                                          "type": "string"
                                      },
                                      "gists_url": {
                                          "type": "string"
                                      },
                                      "starred_url": {
                                          "type": "string"
                                      },
                                      "subscriptions_url": {
                                          "type": "string"
                                      },
                                      "organizations_url": {
                                          "type": "string"
                                      },
                                      "repos_url": {
                                          "type": "string"
                                      },
                                      "events_url": {
                                          "type": "string"
                                      },
                                      "received_events_url": {
                                          "type": "string"
                                      },
                                      "type": {
                                          "type": "string"
                                      }
                                  },
                                  "type": "object"
                              },
                              "private": {
                                  "type": "boolean"
                              },
                              "html_url": {
                                  "type": "string"
                              },
                              "description": {
                                  "type": "string"
                              },
                              "fork": {
                                  "type": "boolean"
                              },
                              "url": {
                                  "type": "string"
                              },
                              "forks_url": {
                                  "type": "string"
                              },
                              "keys_url": {
                                  "type": "string"
                              },
                              "collaborators_url": {
                                  "type": "string"
                              },
                              "teams_url": {
                                  "type": "string"
                              },
                              "hooks_url": {
                                  "type": "string"
                              },
                              "issue_events_url": {
                                  "type": "string"
                              },
                              "events_url": {
                                  "type": "string"
                              },
                              "assignees_url": {
                                  "type": "string"
                              },
                              "branches_url": {
                                  "type": "string"
                              },
                              "tags_url": {
                                  "type": "string"
                              },
                              "blobs_url": {
                                  "type": "string"
                              },
                              "git_tags_url": {
                                  "type": "string"
                              },
                              "git_refs_url": {
                                  "type": "string"
                              },
                              "trees_url": {
                                  "type": "string"
                              },
                              "statuses_url": {
                                  "type": "string"
                              },
                              "languages_url": {
                                  "type": "string"
                              },
                              "stargazers_url": {
                                  "type": "string"
                              },
                              "contributors_url": {
                                  "type": "string"
                              },
                              "subscribers_url": {
                                  "type": "string"
                              },
                              "subscription_url": {
                                  "type": "string"
                              },
                              "commits_url": {
                                  "type": "string"
                              },
                              "git_commits_url": {
                                  "type": "string"
                              },
                              "comments_url": {
                                  "type": "string"
                              },
                              "issue_comment_url": {
                                  "type": "string"
                              },
                              "contents_url": {
                                  "type": "string"
                              },
                              "compare_url": {
                                  "type": "string"
                              },
                              "merges_url": {
                                  "type": "string"
                              },
                              "archive_url": {
                                  "type": "string"
                              },
                              "downloads_url": {
                                  "type": "string"
                              },
                              "issues_url": {
                                  "type": "string"
                              },
                              "pulls_url": {
                                  "type": "string"
                              },
                              "milestones_url": {
                                  "type": "string"
                              },
                              "notifications_url": {
                                  "type": "string"
                              },
                              "labels_url": {
                                  "type": "string"
                              }
                          },
                          "type": "object"
                      },
                      "score": {
                          "type": "number"
                      }
                  },
                  "type": "object"
              }
          ],
          "type": "array"
      }
  }

  """
  And it has this "example"
  """
  {
    "total_count": 104,
    "items": [
      {
        "name": "github-issue-importer.gemspec",
        "path": "github-issue-importer.gemspec",
        "sha": "394508202991504d8a0771ae027454facaaa045a",
        "url": "https://api.github.com/repositories/1586630/contents/github-issue-importer.gemspec?ref=aa22a4be513163c73531e96bd99f4b49d6ded8a6",
        "git_url": "https://api.github.com/repositories/1586630/git/blobs/394508202991504d8a0771ae027454facaaa045a",
        "html_url": "https://github.com/johnf/github-issue-importer/blob/aa22a4be513163c73531e96bd99f4b49d6ded8a6/github-issue-importer.gemspec",
        "repository": {
          "id": 1586630,
          "name": "github-issue-importer",
          "full_name": "johnf/github-issue-importer",
          "owner": {
            "login": "johnf",
            "id": 42590,
            "avatar_url": "https://secure.gravatar.com/avatar/ab4d879ba3233a270aa14f447c795505?d=https://a248.e.akamai.net/assets.github.com/images/gravatars/gravatar-user-420.png",
            "gravatar_id": "ab4d879ba3233a270aa14f447c795505",
            "url": "https://api.github.com/users/johnf",
            "html_url": "https://github.com/johnf",
            "followers_url": "https://api.github.com/users/johnf/followers",
            "following_url": "https://api.github.com/users/johnf/following{/other_user}",
            "gists_url": "https://api.github.com/users/johnf/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/johnf/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/johnf/subscriptions",
            "organizations_url": "https://api.github.com/users/johnf/orgs",
            "repos_url": "https://api.github.com/users/johnf/repos",
            "events_url": "https://api.github.com/users/johnf/events{/privacy}",
            "received_events_url": "https://api.github.com/users/johnf/received_events",
            "type": "User"
          },
          "private": false,
          "html_url": "https://github.com/johnf/github-issue-importer",
          "description": "Import Issues from Launchpad (for now) into github",
          "fork": false,
          "url": "https://api.github.com/repos/johnf/github-issue-importer",
          "forks_url": "https://api.github.com/repos/johnf/github-issue-importer/forks",
          "keys_url": "https://api.github.com/repos/johnf/github-issue-importer/keys{/key_id}",
          "collaborators_url": "https://api.github.com/repos/johnf/github-issue-importer/collaborators{/collaborator}",
          "teams_url": "https://api.github.com/repos/johnf/github-issue-importer/teams",
          "hooks_url": "https://api.github.com/repos/johnf/github-issue-importer/hooks",
          "issue_events_url": "https://api.github.com/repos/johnf/github-issue-importer/issues/events{/number}",
          "events_url": "https://api.github.com/repos/johnf/github-issue-importer/events",
          "assignees_url": "https://api.github.com/repos/johnf/github-issue-importer/assignees{/user}",
          "branches_url": "https://api.github.com/repos/johnf/github-issue-importer/branches{/branch}",
          "tags_url": "https://api.github.com/repos/johnf/github-issue-importer/tags",
          "blobs_url": "https://api.github.com/repos/johnf/github-issue-importer/git/blobs{/sha}",
          "git_tags_url": "https://api.github.com/repos/johnf/github-issue-importer/git/tags{/sha}",
          "git_refs_url": "https://api.github.com/repos/johnf/github-issue-importer/git/refs{/sha}",
          "trees_url": "https://api.github.com/repos/johnf/github-issue-importer/git/trees{/sha}",
          "statuses_url": "https://api.github.com/repos/johnf/github-issue-importer/statuses/{sha}",
          "languages_url": "https://api.github.com/repos/johnf/github-issue-importer/languages",
          "stargazers_url": "https://api.github.com/repos/johnf/github-issue-importer/stargazers",
          "contributors_url": "https://api.github.com/repos/johnf/github-issue-importer/contributors",
          "subscribers_url": "https://api.github.com/repos/johnf/github-issue-importer/subscribers",
          "subscription_url": "https://api.github.com/repos/johnf/github-issue-importer/subscription",
          "commits_url": "https://api.github.com/repos/johnf/github-issue-importer/commits{/sha}",
          "git_commits_url": "https://api.github.com/repos/johnf/github-issue-importer/git/commits{/sha}",
          "comments_url": "https://api.github.com/repos/johnf/github-issue-importer/comments{/number}",
          "issue_comment_url": "https://api.github.com/repos/johnf/github-issue-importer/issues/comments/{number}",
          "contents_url": "https://api.github.com/repos/johnf/github-issue-importer/contents/{ path}",
          "compare_url": "https://api.github.com/repos/johnf/github-issue-importer/compare/{base}...{head}",
          "merges_url": "https://api.github.com/repos/johnf/github-issue-importer/merges",
          "archive_url": "https://api.github.com/repos/johnf/github-issue-importer/{archive_format}{/ref}",
          "downloads_url": "https://api.github.com/repos/johnf/github-issue-importer/downloads",
          "issues_url": "https://api.github.com/repos/johnf/github-issue-importer/issues{/number}",
          "pulls_url": "https://api.github.com/repos/johnf/github-issue-importer/pulls{/number}",
          "milestones_url": "https://api.github.com/repos/johnf/github-issue-importer/milestones{/number}",
          "notifications_url": "https://api.github.com/repos/johnf/github-issue-importer/notifications{?since,all,participating}",
          "labels_url": "https://api.github.com/repos/johnf/github-issue-importer/labels{/name}"
        },
        "score": 0.96691436
      }
    ]
  }

  """
  Then I inspect the object "/search"
  Then I inspect the item "/users" of "resources" collection
  Then I inspect the item "get" of "methods" collection
  And I store it as object "/search-/users-GET"
  And it has this description
  """
  Search users.
  """
  Then I inspect the item "q" of "query_parameters" collection
  And it has this description
  """
  The search terms. This can be any combination of the supported user
  search parameters:
  'Search In' Qualifies which fields are searched. With this qualifier you
  can restrict the search to just the username, public email, full name,
  location, or any combination of these.
  'Repository count' Filters users based on the number of repositories they
  have.
  'Location' Filter users by the location indicated in their profile.
  'Language' Search for users that have repositories that match a certain
  language.
  'Created' Filter users based on when they joined.
  'Followers' Filter users based on the number of followers they have.

  """
  And it has these properties
    | type     | string |
    | required | true |
  Then I inspect the parent object
  Then I inspect the item "sort" of "query_parameters" collection
  And it has this description
  """
  If not provided, results are sorted by best match.
  """
  And the value of the property "enum" is an array of
    | followers    |
    | repositories |
    | joined       |
  Then I inspect the parent object
  Then I inspect the item "order" of "query_parameters" collection
  And it has these properties
    | default | desc |
  And the value of the property "enum" is an array of
    | asc  |
    | desc |
  Then I inspect the object "/search-/users-GET"
  Then I inspect the item "X-GitHub-Media-Type" of "headers" collection
  And it has this description
  """
  You can check the current version of media type in responses.

  """
  And it has these properties
    | type | string |
  Then I inspect the object "/search-/users-GET"
  Then I inspect the item "Accept" of "headers" collection
  And it has this description
  """
  Is used to set specified media type.
  """
  And it has these properties
    | type | string |
  Then I inspect the object "/search-/users-GET"
  Then I inspect the item "X-RateLimit-Limit" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/search-/users-GET"
  Then I inspect the item "X-RateLimit-Remaining" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/search-/users-GET"
  Then I inspect the item "X-RateLimit-Reset" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/search-/users-GET"
  Then I inspect the item "X-GitHub-Request-Id" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/search-/users-GET"
  Then I inspect the item "403" of "responses" collection
  And it has this description
  """
  API rate limit exceeded. See http://developer.github.com/v3/#rate-limiting
  for details.

  """
  Then I inspect the object "/search-/users-GET"
  Then I inspect the item "200" of "responses" collection
  Then I inspect the item "application/json" of "body" collection
  And it has this "schema"
  """
  {
      "$schema": "http://json-schema.org/draft-03/schema",
      "type": "object",
      "properties": {
          "total_count": {
              "type": "integer"
          },
          "items": [
              {
                  "properties": {
                      "login": {
                          "type": "string"
                      },
                      "id": {
                          "type": "integer"
                      },
                      "avatar_url": {
                          "type": "string"
                      },
                      "gravatar_id": {
                          "type": "string"
                      },
                      "url": {
                          "type": "string"
                      },
                      "html_url": {
                          "type": "string"
                      },
                      "followers_url": {
                          "type": "string"
                      },
                      "subscriptions_url": {
                          "type": "string"
                      },
                      "organizations_url": {
                          "type": "string"
                      },
                      "repos_url": {
                          "type": "string"
                      },
                      "received_events_url": {
                          "type": "string"
                      },
                      "type": {
                          "type": "string"
                      },
                      "score": {
                          "type": "number"
                      }
                  },
                  "type": "object"
              }
          ],
          "type": "array"
      }
  }

  """
  And it has this "example"
  """
  {
    "total_count": 12,
    "items": [
      {
        "login": "mojombo",
        "id": 1,
        "avatar_url": "https://secure.gravatar.com/avatar/25c7c18223fb42a4c6ae1c8db6f50f9b?d=https://a248.e.akamai.net/assets.github.com/images/gravatars/gravatar-user-420.png",
        "gravatar_id": "25c7c18223fb42a4c6ae1c8db6f50f9b",
        "url": "https://api.github.com/users/mojombo",
        "html_url": "https://github.com/mojombo",
        "followers_url": "https://api.github.com/users/mojombo/followers",
        "subscriptions_url": "https://api.github.com/users/mojombo/subscriptions",
        "organizations_url": "https://api.github.com/users/mojombo/orgs",
        "repos_url": "https://api.github.com/users/mojombo/repos",
        "received_events_url": "https://api.github.com/users/mojombo/received_events",
        "type": "User",
        "score": 105.47857
      }
    ]
  }

  """
  Then I inspect the root object
  Then I inspect the item "/events" of "resources" collection
  Then I inspect the item "get" of "methods" collection
  And it has this description
  """
  List public events.
  """
  And I store it as object "/events-GET"
  Then I inspect the item "X-GitHub-Media-Type" of "headers" collection
  And it has this description
  """
  You can check the current version of media type in responses.

  """
  And it has these properties
    | type | string |
  Then I inspect the object "/events-GET"
  Then I inspect the item "Accept" of "headers" collection
  And it has this description
  """
  Is used to set specified media type.
  """
  And it has these properties
    | type | string |
  Then I inspect the object "/events-GET"
  Then I inspect the item "X-RateLimit-Limit" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/events-GET"
  Then I inspect the item "X-RateLimit-Remaining" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/events-GET"
  Then I inspect the item "X-RateLimit-Reset" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/events-GET"
  Then I inspect the item "X-GitHub-Request-Id" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/events-GET"
  Then I inspect the item "403" of "responses" collection
  And it has this description
  """
  API rate limit exceeded. See http://developer.github.com/v3/#rate-limiting
  for details.

  """
  Then I inspect the object "/events-GET"
  Then I inspect the item "200" of "responses" collection
  Then I inspect the item "application/json" of "body" collection
  And it has this "schema"
  """
  {
      "$schema": "http://json-schema.org/draft-03/schema",
      "type": "array",
      "properties": [
          {
              "properties": {
                  "type": {
                      "type": "string"
                  },
                  "public": {
                      "type": "boolean"
                  },
                  "payload": {
                      "properties": {},
                      "type": "object"
                  },
                  "repo": {
                      "properties": {
                          "id": {
                              "type": "integer"
                          },
                          "name": {
                              "type": "string"
                          },
                          "url": {
                              "type": "string"
                          }
                      },
                      "type": "object"
                  },
                  "actor": {
                      "properties": {
                          "login": {
                              "type": "string"
                          },
                          "id": {
                              "type": "integer"
                          },
                          "avatar_url": {
                              "type": "string"
                          },
                          "gravatar_id": {
                              "type": "string"
                          },
                          "url": {
                              "type": "string"
                          }
                      },
                      "type": "object"
                  },
                  "org": {
                      "properties": {
                          "login": {
                              "type": "string"
                          },
                          "id": {
                              "type": "integer"
                          },
                          "avatar_url": {
                              "type": "string"
                          },
                          "gravatar_id": {
                              "type": "string"
                          },
                          "url": {
                              "type": "string"
                          }
                      },
                      "type": "object"
                  },
                  "created_at": {
                      "type": "timestamp"
                  },
                  "id": {
                      "type": "integer"
                  }
              },
              "type": "object"
          }
      ]
  }

  """
  And it has this "example"
  """
  [
    {
      "type": "Event",
      "public": true,
      "payload": {

      },
      "repo": {
        "id": 3,
        "name": "octocat/Hello-World",
        "url": "https://api.github.com/repos/octocat/Hello-World"
      },
      "actor": {
        "login": "octocat",
        "id": 1,
        "avatar_url": "https://github.com/images/error/octocat_happy.gif",
        "gravatar_id": "somehexcode",
        "url": "https://api.github.com/users/octocat"
      },
      "org": {
        "login": "octocat",
        "id": 1,
        "avatar_url": "https://github.com/images/error/octocat_happy.gif",
        "gravatar_id": "somehexcode",
        "url": "https://api.github.com/users/octocat"
      },
      "created_at": "2011-09-06T17:26:27Z",
      "id": "12345"
    }
  ]

  """
  Then I inspect the root object
  Then I inspect the item "/feeds" of "resources" collection
  Then I inspect the item "get" of "methods" collection
  And it has this description
  """
  List Feeds.
  GitHub provides several timeline resources in Atom format. The Feeds API
   lists all the feeds available to the authenticating user.

  """
  And I store it as object "/feeds-GET"

  Then I inspect the item "X-GitHub-Media-Type" of "headers" collection
  And it has this description
  """
  You can check the current version of media type in responses.

  """
  And it has these properties
    | type | string |
  Then I inspect the object "/feeds-GET"
  Then I inspect the item "Accept" of "headers" collection
  And it has this description
  """
  Is used to set specified media type.
  """
  And it has these properties
    | type | string |
  Then I inspect the object "/feeds-GET"
  Then I inspect the item "X-RateLimit-Limit" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/feeds-GET"
  Then I inspect the item "X-RateLimit-Remaining" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/feeds-GET"
  Then I inspect the item "X-RateLimit-Reset" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/feeds-GET"
  Then I inspect the item "X-GitHub-Request-Id" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/feeds-GET"
  Then I inspect the item "403" of "responses" collection
  And it has this description
  """
  API rate limit exceeded. See http://developer.github.com/v3/#rate-limiting
  for details.

  """
  Then I inspect the object "/feeds-GET"
  Then I inspect the item "200" of "responses" collection
  Then I inspect the item "application/json" of "body" collection
  And it has this "schema"
  """
  {
    "$schema": "http://json-schema.org/draft-03/schema",
    "type": "object",
    "properties": {
      "timeline_url": {
        "type": "string"
      },
      "user_url": {
        "type": "string"
      },
      "current_user_public": {
        "type": "string"
      },
      "current_user_url": {
        "type": "string"
      },
      "current_user_actor_url": {
        "type": "string"
      },
      "current_user_organization_url": {
        "type": "string"
      },
      "_links": {
        "properties": {
          "timeline": {
            "properties": {
              "href": {
                "type": "string"
              },
              "type": {
                "type": "string"
              }
            },
            "type": "object"
          },
          "user": {
            "properties": {
              "href": {
                "type": "string"
              },
              "type": {
                "type": "string"
              }
            },
            "type": "object"
          },
          "current_user_public": {
            "properties": {
              "href": {
                "type": "string"
              },
              "type": {
                "type": "string"
              }
            },
            "type": "object"
          },
          "current_user": {
            "properties": {
              "href": {
                "type": "string"
              },
              "type": {
                "type": "string"
              }
            },
            "type": "object"
          },
          "current_user_actor": {
            "properties": {
              "href": {
                "type": "string"
              },
              "type": {
                "type": "string"
              }
            },
            "type": "object"
          },
          "current_user_organization": {
            "properties": {
              "href": {
                "type": "string"
              },
              "type": {
                "type": "string"
              }
            },
            "type": "object"
          }
        }
      }
    }
  }

  """
  And it has this "example"
  """
  {
    "timeline_url": "https://github.com/timeline",
    "user_url": "https://github.com/{user}",
    "current_user_public": "https://github.com/defunkt",
    "current_user_url": "https://github.com/defunkt.private?token=abc123",
    "current_user_actor_url": "https://github.com/defunkt.private.actor?token=abc123",
    "current_user_organization_url": "https://github.com/organizations/{org}/defunkt.private.atom?token=abc123",
    "_links": {
      "timeline": {
        "href": "https://github.com/timeline",
        "type": "application/atom xml"
      },
      "user": {
        "href": "https://github.com/{user}",
        "type": "application/atom xml"
      },
      "current_user_public": {
        "href": "https://github.com/defunkt",
        "type": "application/atom xml"
      },
      "current_user": {
        "href": "https://github.com/defunkt.private?token=abc123",
        "type": "application/atom xml"
      },
      "current_user_actor": {
        "href": "https://github.com/defunkt.private.actor?token=abc123",
        "type": "application/atom xml"
      },
      "current_user_organization": {
        "href": "https://github.com/organizations/{org}/defunkt.private.atom?token=abc123",
        "type": "application/atom xml"
      }
    }
  }

  """
  Then I inspect the root object
  Then I inspect the item "/meta" of "resources" collection
  Then I inspect the item "get" of "methods" collection
  And it has this description
  """
  This gives some information about GitHub.com, the service.
  """
  And I store it as object "/meta-GET"

  Then I inspect the item "X-GitHub-Media-Type" of "headers" collection
  And it has this description
  """
  You can check the current version of media type in responses.

  """
  And it has these properties
    | type | string |
  Then I inspect the object "/meta-GET"
  Then I inspect the item "Accept" of "headers" collection
  And it has this description
  """
  Is used to set specified media type.
  """
  And it has these properties
    | type | string |
  Then I inspect the object "/meta-GET"
  Then I inspect the item "X-RateLimit-Limit" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/meta-GET"
  Then I inspect the item "X-RateLimit-Remaining" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/meta-GET"
  Then I inspect the item "X-RateLimit-Reset" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/meta-GET"
  Then I inspect the item "X-GitHub-Request-Id" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/meta-GET"
  Then I inspect the item "403" of "responses" collection
  And it has this description
  """
  API rate limit exceeded. See http://developer.github.com/v3/#rate-limiting
  for details.

  """
  Then I inspect the object "/meta-GET"
  Then I inspect the item "200" of "responses" collection
  Then I inspect the item "application/json" of "body" collection
  And it has this "schema"
  """
  {
      "$schema": "http://json-schema.org/draft-03/schema",
      "type": "object",
      "properties": {
          "hooks": [
              {
                  "description": "An Array of IP addresses in CIDR format specifying the addresses that incoming service hooks will originate from.",
                  "type": "string"
              }
          ],
          "type": "array",
          "git": [
              {
                  "description": "An Array of IP addresses in CIDR format specifying the Git servers at GitHub.",
                  "type": "string"
              }
          ]
      }
  }

  """
  And it has this "example"
  """
  {
    "hooks": [
      "127.0.0.1/32"
    ],
    "git": [
      "127.0.0.1/32"
    ]
  }

  """
  Then I inspect the root object
  Then I inspect the item "/rate_limit" of "resources" collection
  Then I inspect the item "get" of "methods" collection
  And it has this description
  """
  Get your current rate limit status
  Note: Accessing this endpoint does not count against your rate limit.

  """
  And I store it as object "/rate_limit-GET"
  Then I inspect the item "X-GitHub-Media-Type" of "headers" collection
  And it has this description
  """
  You can check the current version of media type in responses.

  """
  And it has these properties
    | type | string |
  Then I inspect the object "/rate_limit-GET"
  Then I inspect the item "Accept" of "headers" collection
  And it has this description
  """
  Is used to set specified media type.
  """
  And it has these properties
    | type | string |
  Then I inspect the object "/rate_limit-GET"
  Then I inspect the item "X-RateLimit-Limit" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/rate_limit-GET"
  Then I inspect the item "X-RateLimit-Remaining" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/rate_limit-GET"
  Then I inspect the item "X-RateLimit-Reset" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/rate_limit-GET"
  Then I inspect the item "X-GitHub-Request-Id" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/rate_limit-GET"
  Then I inspect the item "403" of "responses" collection
  And it has this description
  """
  API rate limit exceeded. See http://developer.github.com/v3/#rate-limiting
  for details.

  """
  Then I inspect the object "/rate_limit-GET"
  Then I inspect the item "200" of "responses" collection
  Then I inspect the item "application/json" of "body" collection
  And it has this "schema"
  """
  {
    "$schema": "http://json-schema.org/draft-03/schema",
    "type": "object",
    "properties": {
      "rate": {
        "properties": {
          "limit": {
            "type": "integer"
          },
          "remaining": {
            "type": "integer"
          },
          "reset": {
            "type": "integer"
          }
        }
      }
    }
  }

  """
  And it has this "example"
  """
  {
    "rate": {
      "limit": 5000,
      "remaining": 4999,
      "reset": 1372700873
    }
  }

  """
  Then I inspect the root object
  Then I inspect the item "/issues" of "resources" collection
  Then I inspect the item "get" of "methods" collection
  And I store it as object "/issues-GET"
  And it has this description
  """
  List issues.
  List all issues across all the authenticated user's visible repositories.

  """
  Then I inspect the item "filter" of "query_parameters" collection
  And it has this description
  """
  Issues assigned to you / created by you / mentioning you / you're
  subscribed to updates for / All issues the authenticated user can see

  """
  And the value of the property "enum" is an array of
    | assigned   |
    | created   |
    | mentioned |
    | subscribed |
    | all |
  And it has these properties
    | default | all |
    | required |  true |
  Then I inspect the object "/issues-GET"
  Then I inspect the item "state" of "query_parameters" collection
  And the value of the property "enum" is an array of
    | open   |
    | closed   |
  And it has these properties
    | default | open |
    | required |  true |
  Then I inspect the object "/issues-GET"
  Then I inspect the item "labels" of "query_parameters" collection
  And it has this description
  """
  String list of comma separated Label names. Example - bug,ui,@high.
  """
  And it has these properties
    | type | string |
    | required |  true |
  Then I inspect the object "/issues-GET"
  Then I inspect the item "sort" of "query_parameters" collection
  And the value of the property "enum" is an array of
    | created   |
    | updated   |
    | comments   |
  And it has these properties
    | default | created |
    | required |  true |
  Then I inspect the object "/issues-GET"
  Then I inspect the item "direction" of "query_parameters" collection
  And the value of the property "enum" is an array of
    | asc   |
    | desc   |
  And it has these properties
    | default | desc |
    | required |  true |
  Then I inspect the object "/issues-GET"
  Then I inspect the item "since" of "query_parameters" collection
  And it has this description
  """
  Optional string of a timestamp in ISO 8601 format: YYYY-MM-DDTHH:MM:SSZ.
  Only issues updated at or after this time are returned.

  """
  And it has these properties
    | type | string |
  Then I inspect the object "/issues-GET"
  Then I inspect the item "X-GitHub-Media-Type" of "headers" collection
  And it has this description
  """
  You can check the current version of media type in responses.

  """
  And it has these properties
    | type | string |
  Then I inspect the object "/issues-GET"
  Then I inspect the item "Accept" of "headers" collection
  And it has this description
  """
  Is used to set specified media type.
  """
  And it has these properties
    | type | string |
  Then I inspect the object "/issues-GET"
  Then I inspect the item "X-RateLimit-Limit" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/issues-GET"
  Then I inspect the item "X-RateLimit-Remaining" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/issues-GET"
  Then I inspect the item "X-RateLimit-Reset" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/issues-GET"
  Then I inspect the item "X-GitHub-Request-Id" of "headers" collection
  And it has these properties
    | type | integer |
  Then I inspect the object "/issues-GET"
  Then I inspect the item "403" of "responses" collection
  And it has this description
  """
  API rate limit exceeded. See http://developer.github.com/v3/#rate-limiting
  for details.

  """
