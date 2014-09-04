{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.CloudSearch.V2013_01_01.DeleteIndexField
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Removes an IndexField from the search domain. For more information, see
-- Configuring Index Fields in the Amazon CloudSearch Developer Guide.
module Network.AWS.CloudSearch.V2013_01_01.DeleteIndexField
    (
    -- * Request
      DeleteIndexField
    -- ** Request constructor
    , deleteIndexField
    -- ** Request lenses
    , diftDomainName
    , diftIndexFieldName

    -- * Response
    , DeleteIndexFieldResponse
    -- ** Response lenses
    , difuIndexField
    ) where

import Network.AWS.Request.Query
import Network.AWS.CloudSearch.V2013_01_01.Types
import Network.AWS.Prelude

-- | Minimum specification for a 'DeleteIndexField' request.
deleteIndexField :: Text -- ^ 'diftDomainName'
                 -> Text -- ^ 'diftIndexFieldName'
                 -> DeleteIndexField
deleteIndexField p1 p2 = DeleteIndexField
    { _diftDomainName = p1
    , _diftIndexFieldName = p2
    }
{-# INLINE deleteIndexField #-}

data DeleteIndexField = DeleteIndexField
    { _diftDomainName :: Text
      -- ^ A string that represents the name of a domain. Domain names are
      -- unique across the domains owned by an account within an AWS
      -- region. Domain names start with a letter or number and can
      -- contain the following characters: a-z (lowercase), 0-9, and -
      -- (hyphen).
    , _diftIndexFieldName :: Text
      -- ^ The name of the index field your want to remove from the domain's
      -- indexing options.
    } deriving (Show, Generic)

-- | A string that represents the name of a domain. Domain names are unique
-- across the domains owned by an account within an AWS region. Domain names
-- start with a letter or number and can contain the following characters: a-z
-- (lowercase), 0-9, and - (hyphen).
diftDomainName :: Lens' DeleteIndexField (Text)
diftDomainName f x =
    f (_diftDomainName x)
        <&> \y -> x { _diftDomainName = y }
{-# INLINE diftDomainName #-}

-- | The name of the index field your want to remove from the domain's indexing
-- options.
diftIndexFieldName :: Lens' DeleteIndexField (Text)
diftIndexFieldName f x =
    f (_diftIndexFieldName x)
        <&> \y -> x { _diftIndexFieldName = y }
{-# INLINE diftIndexFieldName #-}

instance ToQuery DeleteIndexField where
    toQuery = genericQuery def

data DeleteIndexFieldResponse = DeleteIndexFieldResponse
    { _difuIndexField :: IndexFieldStatus
      -- ^ The status of the index field being deleted.
    } deriving (Show, Generic)

-- | The status of the index field being deleted.
difuIndexField :: Lens' DeleteIndexFieldResponse (IndexFieldStatus)
difuIndexField f x =
    f (_difuIndexField x)
        <&> \y -> x { _difuIndexField = y }
{-# INLINE difuIndexField #-}

instance FromXML DeleteIndexFieldResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest DeleteIndexField where
    type Sv DeleteIndexField = CloudSearch
    type Rs DeleteIndexField = DeleteIndexFieldResponse

    request = post "DeleteIndexField"
    response _ = xmlResponse
