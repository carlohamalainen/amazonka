{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.DynamoDB.V2012_08_10.GetItem
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | The GetItem operation returns a set of attributes for the item with the
-- given primary key. If there is no matching item, GetItem does not return
-- any data. GetItem provides an eventually consistent read by default. If
-- your application requires a strongly consistent read, set ConsistentRead to
-- true. Although a strongly consistent read might take more time than an
-- eventually consistent read, it always returns the last updated value.
-- Retrieve Item Attributes This example retrieves three attributes from the
-- Thread table. In the response, the ConsumedCapacityUnits value is 1,
-- because ConsistentRead is set to true. If ConsistentRead had been set to
-- false (or not specified) for the same request, an eventually consistent
-- read would have been used and ConsumedCapacityUnits would have been 0.5. {
-- "ConsumedCapacity": { "CapacityUnits": 1, "TableName": "Thread" }, "Item":
-- { "Tags": { "SS": ["Update","Multiple Items","HelpMe"] },
-- "LastPostDateTime": { "S": "201303190436" }, "Message": { "S": "I want to
-- update multiple items in a single API call. What's the best way to do
-- that?" } } }.
module Network.AWS.DynamoDB.V2012_08_10.GetItem
    (
    -- * Request
      GetItem
    -- ** Request constructor
    , getItem
    -- ** Request lenses
    , giiKey
    , giiTableName
    , giiAttributesToGet
    , giiConsistentRead
    , giiReturnConsumedCapacity

    -- * Response
    , GetItemResponse
    -- ** Response lenses
    , gioItem
    , gioConsumedCapacity
    ) where

import           Network.AWS.DynamoDB.V2012_08_10.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

-- | Minimum specification for a 'GetItem' request.
getItem :: Map Text AttributeValue -- ^ 'giiKey'
        -> Text -- ^ 'giiTableName'
        -> GetItem
getItem p1 p2 = GetItem
    { _giiKey = p1
    , _giiTableName = p2
    , _giiAttributesToGet = Nothing
    , _giiConsistentRead = Nothing
    , _giiReturnConsumedCapacity = Nothing
    }
{-# INLINE getItem #-}

data GetItem = GetItem
    { _giiKey :: Map Text AttributeValue
      -- ^ A map of attribute names to AttributeValue objects, representing
      -- the primary key of the item to retrieve.
    , _giiTableName :: Text
      -- ^ The name of the table containing the requested item.
    , _giiAttributesToGet :: Maybe [Text]
      -- ^ The names of one or more attributes to retrieve. If no attribute
      -- names are specified, then all attributes will be returned. If any
      -- of the requested attributes are not found, they will not appear
      -- in the result.
    , _giiConsistentRead :: Maybe Bool
      -- ^ If set to true, then the operation uses strongly consistent
      -- reads; otherwise, eventually consistent reads are used.
    , _giiReturnConsumedCapacity :: Maybe ReturnConsumedCapacity
      -- ^ If set to TOTAL, the response includes ConsumedCapacity data for
      -- tables and indexes. If set to INDEXES, the repsonse includes
      -- ConsumedCapacity for indexes. If set to NONE (the default),
      -- ConsumedCapacity is not included in the response.
    } deriving (Show, Generic)

-- | A map of attribute names to AttributeValue objects, representing the
-- primary key of the item to retrieve.
giiKey :: Lens' GetItem (Map Text AttributeValue)
giiKey f x =
    f (_giiKey x)
        <&> \y -> x { _giiKey = y }
{-# INLINE giiKey #-}

-- | The name of the table containing the requested item.
giiTableName :: Lens' GetItem (Text)
giiTableName f x =
    f (_giiTableName x)
        <&> \y -> x { _giiTableName = y }
{-# INLINE giiTableName #-}

-- | The names of one or more attributes to retrieve. If no attribute names are
-- specified, then all attributes will be returned. If any of the requested
-- attributes are not found, they will not appear in the result.
giiAttributesToGet :: Lens' GetItem (Maybe [Text])
giiAttributesToGet f x =
    f (_giiAttributesToGet x)
        <&> \y -> x { _giiAttributesToGet = y }
{-# INLINE giiAttributesToGet #-}

-- | If set to true, then the operation uses strongly consistent reads;
-- otherwise, eventually consistent reads are used.
giiConsistentRead :: Lens' GetItem (Maybe Bool)
giiConsistentRead f x =
    f (_giiConsistentRead x)
        <&> \y -> x { _giiConsistentRead = y }
{-# INLINE giiConsistentRead #-}

-- | If set to TOTAL, the response includes ConsumedCapacity data for tables and
-- indexes. If set to INDEXES, the repsonse includes ConsumedCapacity for
-- indexes. If set to NONE (the default), ConsumedCapacity is not included in
-- the response.
giiReturnConsumedCapacity :: Lens' GetItem (Maybe ReturnConsumedCapacity)
giiReturnConsumedCapacity f x =
    f (_giiReturnConsumedCapacity x)
        <&> \y -> x { _giiReturnConsumedCapacity = y }
{-# INLINE giiReturnConsumedCapacity #-}

instance ToPath GetItem

instance ToQuery GetItem

instance ToHeaders GetItem

instance ToJSON GetItem

data GetItemResponse = GetItemResponse
    { _gioItem :: Map Text AttributeValue
      -- ^ A map of attribute names to AttributeValue objects, as specified
      -- by AttributesToGet.
    , _gioConsumedCapacity :: Maybe ConsumedCapacity
      -- ^ Represents the capacity units consumed by an operation. The data
      -- returned includes the total provisioned throughput consumed,
      -- along with statistics for the table and any indexes involved in
      -- the operation. ConsumedCapacity is only returned if it was asked
      -- for in the request. For more information, see Provisioned
      -- Throughput in the Amazon DynamoDB Developer Guide.
    } deriving (Show, Generic)

-- | A map of attribute names to AttributeValue objects, as specified by
-- AttributesToGet.
gioItem :: Lens' GetItemResponse (Map Text AttributeValue)
gioItem f x =
    f (_gioItem x)
        <&> \y -> x { _gioItem = y }
{-# INLINE gioItem #-}

-- | Represents the capacity units consumed by an operation. The data returned
-- includes the total provisioned throughput consumed, along with statistics
-- for the table and any indexes involved in the operation. ConsumedCapacity
-- is only returned if it was asked for in the request. For more information,
-- see Provisioned Throughput in the Amazon DynamoDB Developer Guide.
gioConsumedCapacity :: Lens' GetItemResponse (Maybe ConsumedCapacity)
gioConsumedCapacity f x =
    f (_gioConsumedCapacity x)
        <&> \y -> x { _gioConsumedCapacity = y }
{-# INLINE gioConsumedCapacity #-}

instance FromJSON GetItemResponse

instance AWSRequest GetItem where
    type Sv GetItem = DynamoDB
    type Rs GetItem = GetItemResponse

    request = get
    response _ = jsonResponse
