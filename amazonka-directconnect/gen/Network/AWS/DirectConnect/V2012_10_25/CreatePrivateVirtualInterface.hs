{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.DirectConnect.V2012_10_25.CreatePrivateVirtualInterface
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Creates a new private virtual interface. A virtual interface is the VLAN
-- that transports AWS Direct Connect traffic. A private virtual interface
-- supports sending traffic to a single virtual private cloud (VPC).
module Network.AWS.DirectConnect.V2012_10_25.CreatePrivateVirtualInterface
    (
    -- * Request
      CreatePrivateVirtualInterface
    -- ** Request constructor
    , createPrivateVirtualInterface
    -- ** Request lenses
    , cpvivConnectionId
    , cpvivNewPrivateVirtualInterface

    -- * Response
    , CreatePrivateVirtualInterfaceResponse
    -- ** Response lenses
    , vkAsn
    , vkAmazonAddress
    , vkAuthKey
    , vkConnectionId
    , vkCustomerAddress
    , vkLocation
    , vkOwnerAccount
    , vkRouteFilterPrefixes
    , vkCustomerRouterConfig
    , vkVlan
    , vkVirtualGatewayId
    , vkVirtualInterfaceId
    , vkVirtualInterfaceName
    , vkVirtualInterfaceState
    , vkVirtualInterfaceType
    ) where

import           Network.AWS.DirectConnect.V2012_10_25.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

-- | Minimum specification for a 'CreatePrivateVirtualInterface' request.
createPrivateVirtualInterface :: Text -- ^ 'cpvivConnectionId'
                              -> NewPrivateVirtualInterface -- ^ 'cpvivNewPrivateVirtualInterface'
                              -> CreatePrivateVirtualInterface
createPrivateVirtualInterface p1 p2 = CreatePrivateVirtualInterface
    { _cpvivConnectionId = p1
    , _cpvivNewPrivateVirtualInterface = p2
    }
{-# INLINE createPrivateVirtualInterface #-}

data CreatePrivateVirtualInterface = CreatePrivateVirtualInterface
    { _cpvivConnectionId :: Text
      -- ^ ID of the connection. Example: dxcon-fg5678gh Default: None.
    , _cpvivNewPrivateVirtualInterface :: NewPrivateVirtualInterface
      -- ^ Detailed information for the private virtual interface to be
      -- created. Default: None.
    } deriving (Show, Generic)

-- | ID of the connection. Example: dxcon-fg5678gh Default: None.
cpvivConnectionId :: Lens' CreatePrivateVirtualInterface (Text)
cpvivConnectionId f x =
    f (_cpvivConnectionId x)
        <&> \y -> x { _cpvivConnectionId = y }
{-# INLINE cpvivConnectionId #-}

-- | Detailed information for the private virtual interface to be created.
-- Default: None.
cpvivNewPrivateVirtualInterface :: Lens' CreatePrivateVirtualInterface (NewPrivateVirtualInterface)
cpvivNewPrivateVirtualInterface f x =
    f (_cpvivNewPrivateVirtualInterface x)
        <&> \y -> x { _cpvivNewPrivateVirtualInterface = y }
{-# INLINE cpvivNewPrivateVirtualInterface #-}

instance ToPath CreatePrivateVirtualInterface

instance ToQuery CreatePrivateVirtualInterface

instance ToHeaders CreatePrivateVirtualInterface

instance ToJSON CreatePrivateVirtualInterface

data CreatePrivateVirtualInterfaceResponse = CreatePrivateVirtualInterfaceResponse
    { _vkAsn :: Maybe Integer
      -- ^ Autonomous system (AS) number for Border Gateway Protocol (BGP)
      -- configuration. Example: 65000.
    , _vkAmazonAddress :: Maybe Text
      -- ^ IP address assigned to the Amazon interface. Example:
      -- 192.168.1.1/30.
    , _vkAuthKey :: Maybe Text
      -- ^ Authentication key for BGP configuration. Example: asdf34example.
    , _vkConnectionId :: Maybe Text
      -- ^ ID of the connection. Example: dxcon-fg5678gh Default: None.
    , _vkCustomerAddress :: Maybe Text
      -- ^ IP address assigned to the customer interface. Example:
      -- 192.168.1.2/30.
    , _vkLocation :: Maybe Text
      -- ^ Where the connection is located. Example: EqSV5 Default: None.
    , _vkOwnerAccount :: Maybe Text
    , _vkRouteFilterPrefixes :: [RouteFilterPrefix]
      -- ^ A list of routes to be advertised to the AWS network in this
      -- region (public virtual interface) or your VPC (private virtual
      -- interface).
    , _vkCustomerRouterConfig :: Maybe Text
      -- ^ Information for generating the customer router configuration.
    , _vkVlan :: Maybe Integer
      -- ^ The VLAN ID. Example: 101.
    , _vkVirtualGatewayId :: Maybe Text
      -- ^ The ID of the virtual private gateway to a VPC. This only applies
      -- to private virtual interfaces. Example: vgw-123er56.
    , _vkVirtualInterfaceId :: Maybe Text
      -- ^ ID of the virtual interface. Example: dxvif-123dfg56 Default:
      -- None.
    , _vkVirtualInterfaceName :: Maybe Text
      -- ^ The name of the virtual interface assigned by the customer.
      -- Example: "My VPC".
    , _vkVirtualInterfaceState :: Maybe VirtualInterfaceState
      -- ^ State of the virtual interface. Confirming: The creation of the
      -- virtual interface is pending confirmation from the virtual
      -- interface owner. If the owner of the virtual interface is
      -- different from the owner of the connection on which it is
      -- provisioned, then the virtual interface will remain in this state
      -- until it is confirmed by the virtual interface owner. Verifying:
      -- This state only applies to public virtual interfaces. Each public
      -- virtual interface needs validation before the virtual interface
      -- can be created. Pending: A virtual interface is in this state
      -- from the time that it is created until the virtual interface is
      -- ready to forward traffic. Available: A virtual interface that is
      -- able to forward traffic. Deleting: A virtual interface is in this
      -- state immediately after calling DeleteVirtualInterface until it
      -- can no longer forward traffic. Deleted: A virtual interface that
      -- cannot forward traffic. Rejected: The virtual interface owner has
      -- declined creation of the virtual interface. If a virtual
      -- interface in the 'Confirming' state is deleted by the virtual
      -- interface owner, the virtual interface will enter the 'Rejected'
      -- state.
    , _vkVirtualInterfaceType :: Maybe Text
      -- ^ The type of virtual interface. Example: private (Amazon VPC) or
      -- public (Amazon S3, Amazon DynamoDB, and so on.).
    } deriving (Show, Generic)

-- | Autonomous system (AS) number for Border Gateway Protocol (BGP)
-- configuration. Example: 65000.
vkAsn :: Lens' CreatePrivateVirtualInterfaceResponse (Maybe Integer)
vkAsn f x =
    f (_vkAsn x)
        <&> \y -> x { _vkAsn = y }
{-# INLINE vkAsn #-}

-- | IP address assigned to the Amazon interface. Example: 192.168.1.1/30.
vkAmazonAddress :: Lens' CreatePrivateVirtualInterfaceResponse (Maybe Text)
vkAmazonAddress f x =
    f (_vkAmazonAddress x)
        <&> \y -> x { _vkAmazonAddress = y }
{-# INLINE vkAmazonAddress #-}

-- | Authentication key for BGP configuration. Example: asdf34example.
vkAuthKey :: Lens' CreatePrivateVirtualInterfaceResponse (Maybe Text)
vkAuthKey f x =
    f (_vkAuthKey x)
        <&> \y -> x { _vkAuthKey = y }
{-# INLINE vkAuthKey #-}

-- | ID of the connection. Example: dxcon-fg5678gh Default: None.
vkConnectionId :: Lens' CreatePrivateVirtualInterfaceResponse (Maybe Text)
vkConnectionId f x =
    f (_vkConnectionId x)
        <&> \y -> x { _vkConnectionId = y }
{-# INLINE vkConnectionId #-}

-- | IP address assigned to the customer interface. Example: 192.168.1.2/30.
vkCustomerAddress :: Lens' CreatePrivateVirtualInterfaceResponse (Maybe Text)
vkCustomerAddress f x =
    f (_vkCustomerAddress x)
        <&> \y -> x { _vkCustomerAddress = y }
{-# INLINE vkCustomerAddress #-}

-- | Where the connection is located. Example: EqSV5 Default: None.
vkLocation :: Lens' CreatePrivateVirtualInterfaceResponse (Maybe Text)
vkLocation f x =
    f (_vkLocation x)
        <&> \y -> x { _vkLocation = y }
{-# INLINE vkLocation #-}

vkOwnerAccount :: Lens' CreatePrivateVirtualInterfaceResponse (Maybe Text)
vkOwnerAccount f x =
    f (_vkOwnerAccount x)
        <&> \y -> x { _vkOwnerAccount = y }
{-# INLINE vkOwnerAccount #-}

-- | A list of routes to be advertised to the AWS network in this region (public
-- virtual interface) or your VPC (private virtual interface).
vkRouteFilterPrefixes :: Lens' CreatePrivateVirtualInterfaceResponse ([RouteFilterPrefix])
vkRouteFilterPrefixes f x =
    f (_vkRouteFilterPrefixes x)
        <&> \y -> x { _vkRouteFilterPrefixes = y }
{-# INLINE vkRouteFilterPrefixes #-}

-- | Information for generating the customer router configuration.
vkCustomerRouterConfig :: Lens' CreatePrivateVirtualInterfaceResponse (Maybe Text)
vkCustomerRouterConfig f x =
    f (_vkCustomerRouterConfig x)
        <&> \y -> x { _vkCustomerRouterConfig = y }
{-# INLINE vkCustomerRouterConfig #-}

-- | The VLAN ID. Example: 101.
vkVlan :: Lens' CreatePrivateVirtualInterfaceResponse (Maybe Integer)
vkVlan f x =
    f (_vkVlan x)
        <&> \y -> x { _vkVlan = y }
{-# INLINE vkVlan #-}

-- | The ID of the virtual private gateway to a VPC. This only applies to
-- private virtual interfaces. Example: vgw-123er56.
vkVirtualGatewayId :: Lens' CreatePrivateVirtualInterfaceResponse (Maybe Text)
vkVirtualGatewayId f x =
    f (_vkVirtualGatewayId x)
        <&> \y -> x { _vkVirtualGatewayId = y }
{-# INLINE vkVirtualGatewayId #-}

-- | ID of the virtual interface. Example: dxvif-123dfg56 Default: None.
vkVirtualInterfaceId :: Lens' CreatePrivateVirtualInterfaceResponse (Maybe Text)
vkVirtualInterfaceId f x =
    f (_vkVirtualInterfaceId x)
        <&> \y -> x { _vkVirtualInterfaceId = y }
{-# INLINE vkVirtualInterfaceId #-}

-- | The name of the virtual interface assigned by the customer. Example: "My
-- VPC".
vkVirtualInterfaceName :: Lens' CreatePrivateVirtualInterfaceResponse (Maybe Text)
vkVirtualInterfaceName f x =
    f (_vkVirtualInterfaceName x)
        <&> \y -> x { _vkVirtualInterfaceName = y }
{-# INLINE vkVirtualInterfaceName #-}

-- | State of the virtual interface. Confirming: The creation of the virtual
-- interface is pending confirmation from the virtual interface owner. If the
-- owner of the virtual interface is different from the owner of the
-- connection on which it is provisioned, then the virtual interface will
-- remain in this state until it is confirmed by the virtual interface owner.
-- Verifying: This state only applies to public virtual interfaces. Each
-- public virtual interface needs validation before the virtual interface can
-- be created. Pending: A virtual interface is in this state from the time
-- that it is created until the virtual interface is ready to forward traffic.
-- Available: A virtual interface that is able to forward traffic. Deleting: A
-- virtual interface is in this state immediately after calling
-- DeleteVirtualInterface until it can no longer forward traffic. Deleted: A
-- virtual interface that cannot forward traffic. Rejected: The virtual
-- interface owner has declined creation of the virtual interface. If a
-- virtual interface in the 'Confirming' state is deleted by the virtual
-- interface owner, the virtual interface will enter the 'Rejected' state.
vkVirtualInterfaceState :: Lens' CreatePrivateVirtualInterfaceResponse (Maybe VirtualInterfaceState)
vkVirtualInterfaceState f x =
    f (_vkVirtualInterfaceState x)
        <&> \y -> x { _vkVirtualInterfaceState = y }
{-# INLINE vkVirtualInterfaceState #-}

-- | The type of virtual interface. Example: private (Amazon VPC) or public
-- (Amazon S3, Amazon DynamoDB, and so on.).
vkVirtualInterfaceType :: Lens' CreatePrivateVirtualInterfaceResponse (Maybe Text)
vkVirtualInterfaceType f x =
    f (_vkVirtualInterfaceType x)
        <&> \y -> x { _vkVirtualInterfaceType = y }
{-# INLINE vkVirtualInterfaceType #-}

instance FromJSON CreatePrivateVirtualInterfaceResponse

instance AWSRequest CreatePrivateVirtualInterface where
    type Sv CreatePrivateVirtualInterface = DirectConnect
    type Rs CreatePrivateVirtualInterface = CreatePrivateVirtualInterfaceResponse

    request = get
    response _ = jsonResponse
