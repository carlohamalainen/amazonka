{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.Route53Domains.V2014_05_15.EnableDomainTransferLock
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | This operation sets the transfer lock on the domain (specifically the
-- clientTransferProhibited status) to prevent domain transfers. Successful
-- submission returns an operation ID that you can use to track the progress
-- and completion of the action. If the request is not completed successfully,
-- the domain registrant will be notified by email. EnableDomainTransferLock
-- Example POST / HTTP/1.1 host:route53domains.us-east-1.amazonaws.com
-- x-amz-date:20140711T205230Z authorization:AWS4-HMAC-SHA256
-- Credential=AKIAIOSFODNN7EXAMPLE/20140711/us-east-1/route53domains/aws4_request,
-- 
-- SignedHeaders=content-length;content-type;host;user-agent;x-amz-date;x-amz-target,
-- Signature=[calculated-signature]
-- x-amz-target:Route53Domains_v20140515.EnableDomainTransferLock
-- user-agent:aws-sdk-java/1.8.3 Linux/2.6.18-164.el5PAE Java_HotSpot (TM
-- )_Server_VM/24.60-b09/1.7.0_60 content-type:application/x-amz-json-1.1
-- content-length:[number of characters in the JSON string] {
-- "DomainName":"example.com" } HTTP/1.1 200 Content-Length:[number of
-- characters in the JSON string] {
-- "OperationId":"0b370c79-faa4-40fe-94c8-b423069de3f6" }.
module Network.AWS.Route53Domains.V2014_05_15.EnableDomainTransferLock
    (
    -- * Request
      EnableDomainTransferLock
    -- ** Request constructor
    , enableDomainTransferLock
    -- ** Request lenses
    , edtlrDomainName

    -- * Response
    , EnableDomainTransferLockResponse
    -- ** Response lenses
    , edtlsOperationId
    ) where

import           Network.AWS.Route53Domains.V2014_05_15.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

-- | Minimum specification for a 'EnableDomainTransferLock' request.
enableDomainTransferLock :: Text -- ^ 'edtlrDomainName'
                         -> EnableDomainTransferLock
enableDomainTransferLock p1 = EnableDomainTransferLock
    { _edtlrDomainName = p1
    }
{-# INLINE enableDomainTransferLock #-}

data EnableDomainTransferLock = EnableDomainTransferLock
    { _edtlrDomainName :: Text
      -- ^ The name of a domain. Type: String Default: None Constraints: The
      -- domain name can contain only the letters a through z, the numbers
      -- 0 through 9, and hyphen (-). Internationalized Domain Names are
      -- not supported. Required: Yes.
    } deriving (Show, Generic)

-- | The name of a domain. Type: String Default: None Constraints: The domain
-- name can contain only the letters a through z, the numbers 0 through 9, and
-- hyphen (-). Internationalized Domain Names are not supported. Required:
-- Yes.
edtlrDomainName :: Lens' EnableDomainTransferLock (Text)
edtlrDomainName f x =
    f (_edtlrDomainName x)
        <&> \y -> x { _edtlrDomainName = y }
{-# INLINE edtlrDomainName #-}

instance ToPath EnableDomainTransferLock

instance ToQuery EnableDomainTransferLock

instance ToHeaders EnableDomainTransferLock

instance ToJSON EnableDomainTransferLock

data EnableDomainTransferLockResponse = EnableDomainTransferLockResponse
    { _edtlsOperationId :: Text
      -- ^ Identifier for tracking the progress of the request. To use this
      -- ID to query the operation status, use GetOperationDetail. Type:
      -- String Default: None Constraints: Maximum 255 characters.
    } deriving (Show, Generic)

-- | Identifier for tracking the progress of the request. To use this ID to
-- query the operation status, use GetOperationDetail. Type: String Default:
-- None Constraints: Maximum 255 characters.
edtlsOperationId :: Lens' EnableDomainTransferLockResponse (Text)
edtlsOperationId f x =
    f (_edtlsOperationId x)
        <&> \y -> x { _edtlsOperationId = y }
{-# INLINE edtlsOperationId #-}

instance FromJSON EnableDomainTransferLockResponse

instance AWSRequest EnableDomainTransferLock where
    type Sv EnableDomainTransferLock = Route53Domains
    type Rs EnableDomainTransferLock = EnableDomainTransferLockResponse

    request = get
    response _ = jsonResponse
