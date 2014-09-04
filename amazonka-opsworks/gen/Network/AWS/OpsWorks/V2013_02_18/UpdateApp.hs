{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.OpsWorks.V2013_02_18.UpdateApp
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Updates a specified app. Required Permissions: To use this action, an IAM
-- user must have a Deploy or Manage permissions level for the stack, or an
-- attached policy that explicitly grants permissions. For more information on
-- user permissions, see Managing User Permissions.
module Network.AWS.OpsWorks.V2013_02_18.UpdateApp
    (
    -- * Request
      UpdateApp
    -- ** Request constructor
    , updateApp
    -- ** Request lenses
    , uarAppId
    , uarAttributes
    , uarType
    , uarEnableSsl
    , uarDataSources
    , uarAppSource
    , uarSslConfiguration
    , uarName
    , uarDescription
    , uarDomains

    -- * Response
    , UpdateAppResponse
    ) where

import           Network.AWS.OpsWorks.V2013_02_18.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

-- | Minimum specification for a 'UpdateApp' request.
updateApp :: Text -- ^ 'uarAppId'
          -> UpdateApp
updateApp p1 = UpdateApp
    { _uarAppId = p1
    , _uarAttributes = mempty
    , _uarType = Nothing
    , _uarEnableSsl = Nothing
    , _uarDataSources = mempty
    , _uarAppSource = Nothing
    , _uarSslConfiguration = Nothing
    , _uarName = Nothing
    , _uarDescription = Nothing
    , _uarDomains = mempty
    }
{-# INLINE updateApp #-}

data UpdateApp = UpdateApp
    { _uarAppId :: Text
      -- ^ The app ID.
    , _uarAttributes :: Map AppAttributesKeys Text
      -- ^ One or more user-defined key/value pairs to be added to the stack
      -- attributes.
    , _uarType :: Maybe AppType
      -- ^ The app type.
    , _uarEnableSsl :: Maybe Bool
      -- ^ Whether SSL is enabled for the app.
    , _uarDataSources :: [DataSource]
      -- ^ The app's data sources.
    , _uarAppSource :: Maybe Source
      -- ^ A Source object that specifies the app repository.
    , _uarSslConfiguration :: Maybe SslConfiguration
      -- ^ An SslConfiguration object with the SSL configuration.
    , _uarName :: Maybe Text
      -- ^ The app name.
    , _uarDescription :: Maybe Text
      -- ^ A description of the app.
    , _uarDomains :: [Text]
      -- ^ The app's virtual host settings, with multiple domains separated
      -- by commas. For example: 'www.example.com, example.com'.
    } deriving (Show, Generic)

-- | The app ID.
uarAppId :: Lens' UpdateApp (Text)
uarAppId f x =
    f (_uarAppId x)
        <&> \y -> x { _uarAppId = y }
{-# INLINE uarAppId #-}

-- | One or more user-defined key/value pairs to be added to the stack
-- attributes.
uarAttributes :: Lens' UpdateApp (Map AppAttributesKeys Text)
uarAttributes f x =
    f (_uarAttributes x)
        <&> \y -> x { _uarAttributes = y }
{-# INLINE uarAttributes #-}

-- | The app type.
uarType :: Lens' UpdateApp (Maybe AppType)
uarType f x =
    f (_uarType x)
        <&> \y -> x { _uarType = y }
{-# INLINE uarType #-}

-- | Whether SSL is enabled for the app.
uarEnableSsl :: Lens' UpdateApp (Maybe Bool)
uarEnableSsl f x =
    f (_uarEnableSsl x)
        <&> \y -> x { _uarEnableSsl = y }
{-# INLINE uarEnableSsl #-}

-- | The app's data sources.
uarDataSources :: Lens' UpdateApp ([DataSource])
uarDataSources f x =
    f (_uarDataSources x)
        <&> \y -> x { _uarDataSources = y }
{-# INLINE uarDataSources #-}

-- | A Source object that specifies the app repository.
uarAppSource :: Lens' UpdateApp (Maybe Source)
uarAppSource f x =
    f (_uarAppSource x)
        <&> \y -> x { _uarAppSource = y }
{-# INLINE uarAppSource #-}

-- | An SslConfiguration object with the SSL configuration.
uarSslConfiguration :: Lens' UpdateApp (Maybe SslConfiguration)
uarSslConfiguration f x =
    f (_uarSslConfiguration x)
        <&> \y -> x { _uarSslConfiguration = y }
{-# INLINE uarSslConfiguration #-}

-- | The app name.
uarName :: Lens' UpdateApp (Maybe Text)
uarName f x =
    f (_uarName x)
        <&> \y -> x { _uarName = y }
{-# INLINE uarName #-}

-- | A description of the app.
uarDescription :: Lens' UpdateApp (Maybe Text)
uarDescription f x =
    f (_uarDescription x)
        <&> \y -> x { _uarDescription = y }
{-# INLINE uarDescription #-}

-- | The app's virtual host settings, with multiple domains separated by commas.
-- For example: 'www.example.com, example.com'.
uarDomains :: Lens' UpdateApp ([Text])
uarDomains f x =
    f (_uarDomains x)
        <&> \y -> x { _uarDomains = y }
{-# INLINE uarDomains #-}

instance ToPath UpdateApp

instance ToQuery UpdateApp

instance ToHeaders UpdateApp

instance ToJSON UpdateApp

data UpdateAppResponse = UpdateAppResponse
    deriving (Eq, Show, Generic)

instance AWSRequest UpdateApp where
    type Sv UpdateApp = OpsWorks
    type Rs UpdateApp = UpdateAppResponse

    request = get
    response _ = nullaryResponse UpdateAppResponse
