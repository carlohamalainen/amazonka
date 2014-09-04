{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.Redshift.V2012_12_01.CreateCluster
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Creates a new cluster. To create the cluster in virtual private cloud
-- (VPC), you must provide cluster subnet group name. If you don't provide a
-- cluster subnet group name or the cluster security group parameter, Amazon
-- Redshift creates a non-VPC cluster, it associates the default cluster
-- security group with the cluster. For more information about managing
-- clusters, go to Amazon Redshift Clusters in the Amazon Redshift Management
-- Guide . Create a non-VPC cluster. https://redshift.us-east-1.amazonaws.com/
-- ?Action=CreateCluster &ClusterIdentifier=examplecluster
-- &MasterUsername=masteruser &MasterUserPassword=12345678Aa &NumberOfNodes=2
-- &NodeType=dw1.xlarge &Version=2012-12-01 &x-amz-algorithm=AWS4-HMAC-SHA256
-- &x-amz-credential=AKIAIOSFODNN7EXAMPLE/20130123/us-east-1/redshift/aws4_request
-- &x-amz-date=20130123T000028Z
-- &x-amz-signedheaders=content-type;host;x-amz-date **** 1.0 creating 2 1
-- true false dev sun:10:30-sun:11:00 in-sync default.redshift-1.0 active
-- default dw1.xlarge examplecluster true masteruser
-- e69b1294-64ef-11e2-b07c-f7fbdd006c67 Create cluster in virtual private
-- cloud (VPC). This example request specifies a ClusterSubnetGroup in the
-- request. https://redshift.us-east-1.amazonaws.com/ ?Action=CreateCluster
-- &ClusterIdentifier=exampleclusterinvpc &MasterUsername=master
-- &MasterUserPassword=1234abcdA &NodeType=dw1.xlarge &NumberOfNodes=2
-- &ClusterSubnetGroupName=mysubnetgroup1 &Version=2012-12-01
-- &x-amz-algorithm=AWS4-HMAC-SHA256
-- &x-amz-credential=AKIAIOSFODNN7EXAMPLE/20130123/us-east-1/redshift/aws4_request
-- &x-amz-date=20130123T000028Z
-- &x-amz-signedheaders=content-type;host;x-amz-date **** mysubnetgroup1 1.0
-- creating 2 1 false false dev sat:08:30-sat:09:00 in-sync
-- default.redshift-1.0 vpc-796a5913 dw1.xlarge exampleclusterinvpc true
-- master fa337bb4-6a4d-11e2-a12a-cb8076a904bd.
module Network.AWS.Redshift.V2012_12_01.CreateCluster
    (
    -- * Request
      CreateCluster
    -- ** Request constructor
    , createCluster
    -- ** Request lenses
    , ccmClusterIdentifier
    , ccmNodeType
    , ccmMasterUsername
    , ccmMasterUserPassword
    , ccmAllowVersionUpgrade
    , ccmPubliclyAccessible
    , ccmEncrypted
    , ccmClusterSecurityGroups
    , ccmAutomatedSnapshotRetentionPeriod
    , ccmPort
    , ccmNumberOfNodes
    , ccmDBName
    , ccmClusterType
    , ccmClusterSubnetGroupName
    , ccmAvailabilityZone
    , ccmPreferredMaintenanceWindow
    , ccmClusterParameterGroupName
    , ccmClusterVersion
    , ccmHsmClientCertificateIdentifier
    , ccmHsmConfigurationIdentifier
    , ccmElasticIp
    , ccmVpcSecurityGroupIds

    -- * Response
    , CreateClusterResponse
    -- ** Response lenses
    , cwCluster
    ) where

import Network.AWS.Request.Query
import Network.AWS.Redshift.V2012_12_01.Types
import Network.AWS.Prelude

-- | Minimum specification for a 'CreateCluster' request.
createCluster :: Text -- ^ 'ccmClusterIdentifier'
              -> Text -- ^ 'ccmNodeType'
              -> Text -- ^ 'ccmMasterUsername'
              -> Text -- ^ 'ccmMasterUserPassword'
              -> CreateCluster
createCluster p1 p2 p3 p4 = CreateCluster
    { _ccmClusterIdentifier = p1
    , _ccmNodeType = p2
    , _ccmMasterUsername = p3
    , _ccmMasterUserPassword = p4
    , _ccmAllowVersionUpgrade = Nothing
    , _ccmPubliclyAccessible = Nothing
    , _ccmEncrypted = Nothing
    , _ccmClusterSecurityGroups = mempty
    , _ccmAutomatedSnapshotRetentionPeriod = Nothing
    , _ccmPort = Nothing
    , _ccmNumberOfNodes = Nothing
    , _ccmDBName = Nothing
    , _ccmClusterType = Nothing
    , _ccmClusterSubnetGroupName = Nothing
    , _ccmAvailabilityZone = Nothing
    , _ccmPreferredMaintenanceWindow = Nothing
    , _ccmClusterParameterGroupName = Nothing
    , _ccmClusterVersion = Nothing
    , _ccmHsmClientCertificateIdentifier = Nothing
    , _ccmHsmConfigurationIdentifier = Nothing
    , _ccmElasticIp = Nothing
    , _ccmVpcSecurityGroupIds = mempty
    }
{-# INLINE createCluster #-}

data CreateCluster = CreateCluster
    { _ccmClusterIdentifier :: Text
      -- ^ A unique identifier for the cluster. You use this identifier to
      -- refer to the cluster for any subsequent cluster operations such
      -- as deleting or modifying. The identifier also appears in the
      -- Amazon Redshift console. Constraints: Must contain from 1 to 63
      -- alphanumeric characters or hyphens. Alphabetic characters must be
      -- lowercase. First character must be a letter. Cannot end with a
      -- hyphen or contain two consecutive hyphens. Must be unique for all
      -- clusters within an AWS account. Example: myexamplecluster.
    , _ccmNodeType :: Text
      -- ^ The node type to be provisioned for the cluster. For information
      -- about node types, go to Working with Clusters in the Amazon
      -- Redshift Management Guide. Valid Values: dw1.xlarge | dw1.8xlarge
      -- | dw2.large | dw2.8xlarge.
    , _ccmMasterUsername :: Text
      -- ^ The user name associated with the master user account for the
      -- cluster that is being created. Constraints: Must be 1 - 128
      -- alphanumeric characters. First character must be a letter. Cannot
      -- be a reserved word. A list of reserved words can be found in
      -- Reserved Words in the Amazon Redshift Database Developer Guide.
    , _ccmMasterUserPassword :: Text
      -- ^ The password associated with the master user account for the
      -- cluster that is being created. Constraints: Must be between 8 and
      -- 64 characters in length. Must contain at least one uppercase
      -- letter. Must contain at least one lowercase letter. Must contain
      -- one number. Can be any printable ASCII character (ASCII code 33
      -- to 126) except ' (single quote), " (double quote), \, /, @, or
      -- space.
    , _ccmAllowVersionUpgrade :: Maybe Bool
      -- ^ If true, upgrades can be applied during the maintenance window to
      -- the Amazon Redshift engine that is running on the cluster. When a
      -- new version of the Amazon Redshift engine is released, you can
      -- request that the service automatically apply upgrades during the
      -- maintenance window to the Amazon Redshift engine that is running
      -- on your cluster. Default: true.
    , _ccmPubliclyAccessible :: Maybe Bool
      -- ^ If true, the cluster can be accessed from a public network.
    , _ccmEncrypted :: Maybe Bool
      -- ^ If true, the data in the cluster is encrypted at rest. Default:
      -- false.
    , _ccmClusterSecurityGroups :: [Text]
      -- ^ A list of security groups to be associated with this cluster.
      -- Default: The default cluster security group for Amazon Redshift.
    , _ccmAutomatedSnapshotRetentionPeriod :: Maybe Integer
      -- ^ The number of days that automated snapshots are retained. If the
      -- value is 0, automated snapshots are disabled. Even if automated
      -- snapshots are disabled, you can still create manual snapshots
      -- when you want with CreateClusterSnapshot. Default: 1 Constraints:
      -- Must be a value from 0 to 35.
    , _ccmPort :: Maybe Integer
      -- ^ The port number on which the cluster accepts incoming
      -- connections. The cluster is accessible only via the JDBC and ODBC
      -- connection strings. Part of the connection string requires the
      -- port on which the cluster will listen for incoming connections.
      -- Default: 5439 Valid Values: 1150-65535.
    , _ccmNumberOfNodes :: Maybe Integer
      -- ^ The number of compute nodes in the cluster. This parameter is
      -- required when the ClusterType parameter is specified as
      -- multi-node. For information about determining how many nodes you
      -- need, go to Working with Clusters in the Amazon Redshift
      -- Management Guide. If you don't specify this parameter, you get a
      -- single-node cluster. When requesting a multi-node cluster, you
      -- must specify the number of nodes that you want in the cluster.
      -- Default: 1 Constraints: Value must be at least 1 and no more than
      -- 100.
    , _ccmDBName :: Maybe Text
      -- ^ The name of the first database to be created when the cluster is
      -- created. To create additional databases after the cluster is
      -- created, connect to the cluster with a SQL client and use SQL
      -- commands to create a database. For more information, go to Create
      -- a Database in the Amazon Redshift Database Developer Guide.
      -- Default: dev Constraints: Must contain 1 to 64 alphanumeric
      -- characters. Must contain only lowercase letters. Cannot be a word
      -- that is reserved by the service. A list of reserved words can be
      -- found in Reserved Words in the Amazon Redshift Database Developer
      -- Guide.
    , _ccmClusterType :: Maybe Text
      -- ^ The type of the cluster. When cluster type is specified as
      -- single-node, the NumberOfNodes parameter is not required.
      -- multi-node, the NumberOfNodes parameter is required. Valid
      -- Values: multi-node | single-node Default: multi-node.
    , _ccmClusterSubnetGroupName :: Maybe Text
      -- ^ The name of a cluster subnet group to be associated with this
      -- cluster. If this parameter is not provided the resulting cluster
      -- will be deployed outside virtual private cloud (VPC).
    , _ccmAvailabilityZone :: Maybe Text
      -- ^ The EC2 Availability Zone (AZ) in which you want Amazon Redshift
      -- to provision the cluster. For example, if you have several EC2
      -- instances running in a specific Availability Zone, then you might
      -- want the cluster to be provisioned in the same zone in order to
      -- decrease network latency. Default: A random, system-chosen
      -- Availability Zone in the region that is specified by the
      -- endpoint. Example: us-east-1d Constraint: The specified
      -- Availability Zone must be in the same region as the current
      -- endpoint.
    , _ccmPreferredMaintenanceWindow :: Maybe Text
      -- ^ The weekly time range (in UTC) during which automated cluster
      -- maintenance can occur. Format: ddd:hh24:mi-ddd:hh24:mi Default: A
      -- 30-minute window selected at random from an 8-hour block of time
      -- per region, occurring on a random day of the week. The following
      -- list shows the time blocks for each region from which the default
      -- maintenance windows are assigned. US-East (Northern Virginia)
      -- Region: 03:00-11:00 UTC US-West (Oregon) Region 06:00-14:00 UTC
      -- EU (Ireland) Region 22:00-06:00 UTC Asia Pacific (Singapore)
      -- Region 14:00-22:00 UTC Asia Pacific (Sydney) Region 12:00-20:00
      -- UTC Asia Pacific (Tokyo) Region 17:00-03:00 UTC Valid Days: Mon |
      -- Tue | Wed | Thu | Fri | Sat | Sun Constraints: Minimum 30-minute
      -- window.
    , _ccmClusterParameterGroupName :: Maybe Text
      -- ^ The name of the parameter group to be associated with this
      -- cluster. Default: The default Amazon Redshift cluster parameter
      -- group. For information about the default parameter group, go to
      -- Working with Amazon Redshift Parameter Groups Constraints: Must
      -- be 1 to 255 alphanumeric characters or hyphens. First character
      -- must be a letter. Cannot end with a hyphen or contain two
      -- consecutive hyphens.
    , _ccmClusterVersion :: Maybe Text
      -- ^ The version of the Amazon Redshift engine software that you want
      -- to deploy on the cluster. The version selected runs on all the
      -- nodes in the cluster. Constraints: Only version 1.0 is currently
      -- available. Example: 1.0.
    , _ccmHsmClientCertificateIdentifier :: Maybe Text
      -- ^ Specifies the name of the HSM client certificate the Amazon
      -- Redshift cluster uses to retrieve the data encryption keys stored
      -- in an HSM.
    , _ccmHsmConfigurationIdentifier :: Maybe Text
      -- ^ Specifies the name of the HSM configuration that contains the
      -- information the Amazon Redshift cluster can use to retrieve and
      -- store keys in an HSM.
    , _ccmElasticIp :: Maybe Text
      -- ^ The Elastic IP (EIP) address for the cluster. Constraints: The
      -- cluster must be provisioned in EC2-VPC and publicly-accessible
      -- through an Internet gateway. For more information about
      -- provisioning clusters in EC2-VPC, go to Supported Platforms to
      -- Launch Your Cluster in the Amazon Redshift Management Guide.
    , _ccmVpcSecurityGroupIds :: [Text]
      -- ^ A list of Virtual Private Cloud (VPC) security groups to be
      -- associated with the cluster. Default: The default VPC security
      -- group is associated with the cluster.
    } deriving (Show, Generic)

-- | A unique identifier for the cluster. You use this identifier to refer to
-- the cluster for any subsequent cluster operations such as deleting or
-- modifying. The identifier also appears in the Amazon Redshift console.
-- Constraints: Must contain from 1 to 63 alphanumeric characters or hyphens.
-- Alphabetic characters must be lowercase. First character must be a letter.
-- Cannot end with a hyphen or contain two consecutive hyphens. Must be unique
-- for all clusters within an AWS account. Example: myexamplecluster.
ccmClusterIdentifier :: Lens' CreateCluster (Text)
ccmClusterIdentifier f x =
    f (_ccmClusterIdentifier x)
        <&> \y -> x { _ccmClusterIdentifier = y }
{-# INLINE ccmClusterIdentifier #-}

-- | The node type to be provisioned for the cluster. For information about node
-- types, go to Working with Clusters in the Amazon Redshift Management Guide.
-- Valid Values: dw1.xlarge | dw1.8xlarge | dw2.large | dw2.8xlarge.
ccmNodeType :: Lens' CreateCluster (Text)
ccmNodeType f x =
    f (_ccmNodeType x)
        <&> \y -> x { _ccmNodeType = y }
{-# INLINE ccmNodeType #-}

-- | The user name associated with the master user account for the cluster that
-- is being created. Constraints: Must be 1 - 128 alphanumeric characters.
-- First character must be a letter. Cannot be a reserved word. A list of
-- reserved words can be found in Reserved Words in the Amazon Redshift
-- Database Developer Guide.
ccmMasterUsername :: Lens' CreateCluster (Text)
ccmMasterUsername f x =
    f (_ccmMasterUsername x)
        <&> \y -> x { _ccmMasterUsername = y }
{-# INLINE ccmMasterUsername #-}

-- | The password associated with the master user account for the cluster that
-- is being created. Constraints: Must be between 8 and 64 characters in
-- length. Must contain at least one uppercase letter. Must contain at least
-- one lowercase letter. Must contain one number. Can be any printable ASCII
-- character (ASCII code 33 to 126) except ' (single quote), " (double quote),
-- \, /, @, or space.
ccmMasterUserPassword :: Lens' CreateCluster (Text)
ccmMasterUserPassword f x =
    f (_ccmMasterUserPassword x)
        <&> \y -> x { _ccmMasterUserPassword = y }
{-# INLINE ccmMasterUserPassword #-}

-- | If true, upgrades can be applied during the maintenance window to the
-- Amazon Redshift engine that is running on the cluster. When a new version
-- of the Amazon Redshift engine is released, you can request that the service
-- automatically apply upgrades during the maintenance window to the Amazon
-- Redshift engine that is running on your cluster. Default: true.
ccmAllowVersionUpgrade :: Lens' CreateCluster (Maybe Bool)
ccmAllowVersionUpgrade f x =
    f (_ccmAllowVersionUpgrade x)
        <&> \y -> x { _ccmAllowVersionUpgrade = y }
{-# INLINE ccmAllowVersionUpgrade #-}

-- | If true, the cluster can be accessed from a public network.
ccmPubliclyAccessible :: Lens' CreateCluster (Maybe Bool)
ccmPubliclyAccessible f x =
    f (_ccmPubliclyAccessible x)
        <&> \y -> x { _ccmPubliclyAccessible = y }
{-# INLINE ccmPubliclyAccessible #-}

-- | If true, the data in the cluster is encrypted at rest. Default: false.
ccmEncrypted :: Lens' CreateCluster (Maybe Bool)
ccmEncrypted f x =
    f (_ccmEncrypted x)
        <&> \y -> x { _ccmEncrypted = y }
{-# INLINE ccmEncrypted #-}

-- | A list of security groups to be associated with this cluster. Default: The
-- default cluster security group for Amazon Redshift.
ccmClusterSecurityGroups :: Lens' CreateCluster ([Text])
ccmClusterSecurityGroups f x =
    f (_ccmClusterSecurityGroups x)
        <&> \y -> x { _ccmClusterSecurityGroups = y }
{-# INLINE ccmClusterSecurityGroups #-}

-- | The number of days that automated snapshots are retained. If the value is
-- 0, automated snapshots are disabled. Even if automated snapshots are
-- disabled, you can still create manual snapshots when you want with
-- CreateClusterSnapshot. Default: 1 Constraints: Must be a value from 0 to
-- 35.
ccmAutomatedSnapshotRetentionPeriod :: Lens' CreateCluster (Maybe Integer)
ccmAutomatedSnapshotRetentionPeriod f x =
    f (_ccmAutomatedSnapshotRetentionPeriod x)
        <&> \y -> x { _ccmAutomatedSnapshotRetentionPeriod = y }
{-# INLINE ccmAutomatedSnapshotRetentionPeriod #-}

-- | The port number on which the cluster accepts incoming connections. The
-- cluster is accessible only via the JDBC and ODBC connection strings. Part
-- of the connection string requires the port on which the cluster will listen
-- for incoming connections. Default: 5439 Valid Values: 1150-65535.
ccmPort :: Lens' CreateCluster (Maybe Integer)
ccmPort f x =
    f (_ccmPort x)
        <&> \y -> x { _ccmPort = y }
{-# INLINE ccmPort #-}

-- | The number of compute nodes in the cluster. This parameter is required when
-- the ClusterType parameter is specified as multi-node. For information about
-- determining how many nodes you need, go to Working with Clusters in the
-- Amazon Redshift Management Guide. If you don't specify this parameter, you
-- get a single-node cluster. When requesting a multi-node cluster, you must
-- specify the number of nodes that you want in the cluster. Default: 1
-- Constraints: Value must be at least 1 and no more than 100.
ccmNumberOfNodes :: Lens' CreateCluster (Maybe Integer)
ccmNumberOfNodes f x =
    f (_ccmNumberOfNodes x)
        <&> \y -> x { _ccmNumberOfNodes = y }
{-# INLINE ccmNumberOfNodes #-}

-- | The name of the first database to be created when the cluster is created.
-- To create additional databases after the cluster is created, connect to the
-- cluster with a SQL client and use SQL commands to create a database. For
-- more information, go to Create a Database in the Amazon Redshift Database
-- Developer Guide. Default: dev Constraints: Must contain 1 to 64
-- alphanumeric characters. Must contain only lowercase letters. Cannot be a
-- word that is reserved by the service. A list of reserved words can be found
-- in Reserved Words in the Amazon Redshift Database Developer Guide.
ccmDBName :: Lens' CreateCluster (Maybe Text)
ccmDBName f x =
    f (_ccmDBName x)
        <&> \y -> x { _ccmDBName = y }
{-# INLINE ccmDBName #-}

-- | The type of the cluster. When cluster type is specified as single-node, the
-- NumberOfNodes parameter is not required. multi-node, the NumberOfNodes
-- parameter is required. Valid Values: multi-node | single-node Default:
-- multi-node.
ccmClusterType :: Lens' CreateCluster (Maybe Text)
ccmClusterType f x =
    f (_ccmClusterType x)
        <&> \y -> x { _ccmClusterType = y }
{-# INLINE ccmClusterType #-}

-- | The name of a cluster subnet group to be associated with this cluster. If
-- this parameter is not provided the resulting cluster will be deployed
-- outside virtual private cloud (VPC).
ccmClusterSubnetGroupName :: Lens' CreateCluster (Maybe Text)
ccmClusterSubnetGroupName f x =
    f (_ccmClusterSubnetGroupName x)
        <&> \y -> x { _ccmClusterSubnetGroupName = y }
{-# INLINE ccmClusterSubnetGroupName #-}

-- | The EC2 Availability Zone (AZ) in which you want Amazon Redshift to
-- provision the cluster. For example, if you have several EC2 instances
-- running in a specific Availability Zone, then you might want the cluster to
-- be provisioned in the same zone in order to decrease network latency.
-- Default: A random, system-chosen Availability Zone in the region that is
-- specified by the endpoint. Example: us-east-1d Constraint: The specified
-- Availability Zone must be in the same region as the current endpoint.
ccmAvailabilityZone :: Lens' CreateCluster (Maybe Text)
ccmAvailabilityZone f x =
    f (_ccmAvailabilityZone x)
        <&> \y -> x { _ccmAvailabilityZone = y }
{-# INLINE ccmAvailabilityZone #-}

-- | The weekly time range (in UTC) during which automated cluster maintenance
-- can occur. Format: ddd:hh24:mi-ddd:hh24:mi Default: A 30-minute window
-- selected at random from an 8-hour block of time per region, occurring on a
-- random day of the week. The following list shows the time blocks for each
-- region from which the default maintenance windows are assigned. US-East
-- (Northern Virginia) Region: 03:00-11:00 UTC US-West (Oregon) Region
-- 06:00-14:00 UTC EU (Ireland) Region 22:00-06:00 UTC Asia Pacific
-- (Singapore) Region 14:00-22:00 UTC Asia Pacific (Sydney) Region 12:00-20:00
-- UTC Asia Pacific (Tokyo) Region 17:00-03:00 UTC Valid Days: Mon | Tue | Wed
-- | Thu | Fri | Sat | Sun Constraints: Minimum 30-minute window.
ccmPreferredMaintenanceWindow :: Lens' CreateCluster (Maybe Text)
ccmPreferredMaintenanceWindow f x =
    f (_ccmPreferredMaintenanceWindow x)
        <&> \y -> x { _ccmPreferredMaintenanceWindow = y }
{-# INLINE ccmPreferredMaintenanceWindow #-}

-- | The name of the parameter group to be associated with this cluster.
-- Default: The default Amazon Redshift cluster parameter group. For
-- information about the default parameter group, go to Working with Amazon
-- Redshift Parameter Groups Constraints: Must be 1 to 255 alphanumeric
-- characters or hyphens. First character must be a letter. Cannot end with a
-- hyphen or contain two consecutive hyphens.
ccmClusterParameterGroupName :: Lens' CreateCluster (Maybe Text)
ccmClusterParameterGroupName f x =
    f (_ccmClusterParameterGroupName x)
        <&> \y -> x { _ccmClusterParameterGroupName = y }
{-# INLINE ccmClusterParameterGroupName #-}

-- | The version of the Amazon Redshift engine software that you want to deploy
-- on the cluster. The version selected runs on all the nodes in the cluster.
-- Constraints: Only version 1.0 is currently available. Example: 1.0.
ccmClusterVersion :: Lens' CreateCluster (Maybe Text)
ccmClusterVersion f x =
    f (_ccmClusterVersion x)
        <&> \y -> x { _ccmClusterVersion = y }
{-# INLINE ccmClusterVersion #-}

-- | Specifies the name of the HSM client certificate the Amazon Redshift
-- cluster uses to retrieve the data encryption keys stored in an HSM.
ccmHsmClientCertificateIdentifier :: Lens' CreateCluster (Maybe Text)
ccmHsmClientCertificateIdentifier f x =
    f (_ccmHsmClientCertificateIdentifier x)
        <&> \y -> x { _ccmHsmClientCertificateIdentifier = y }
{-# INLINE ccmHsmClientCertificateIdentifier #-}

-- | Specifies the name of the HSM configuration that contains the information
-- the Amazon Redshift cluster can use to retrieve and store keys in an HSM.
ccmHsmConfigurationIdentifier :: Lens' CreateCluster (Maybe Text)
ccmHsmConfigurationIdentifier f x =
    f (_ccmHsmConfigurationIdentifier x)
        <&> \y -> x { _ccmHsmConfigurationIdentifier = y }
{-# INLINE ccmHsmConfigurationIdentifier #-}

-- | The Elastic IP (EIP) address for the cluster. Constraints: The cluster must
-- be provisioned in EC2-VPC and publicly-accessible through an Internet
-- gateway. For more information about provisioning clusters in EC2-VPC, go to
-- Supported Platforms to Launch Your Cluster in the Amazon Redshift
-- Management Guide.
ccmElasticIp :: Lens' CreateCluster (Maybe Text)
ccmElasticIp f x =
    f (_ccmElasticIp x)
        <&> \y -> x { _ccmElasticIp = y }
{-# INLINE ccmElasticIp #-}

-- | A list of Virtual Private Cloud (VPC) security groups to be associated with
-- the cluster. Default: The default VPC security group is associated with the
-- cluster.
ccmVpcSecurityGroupIds :: Lens' CreateCluster ([Text])
ccmVpcSecurityGroupIds f x =
    f (_ccmVpcSecurityGroupIds x)
        <&> \y -> x { _ccmVpcSecurityGroupIds = y }
{-# INLINE ccmVpcSecurityGroupIds #-}

instance ToQuery CreateCluster where
    toQuery = genericQuery def

data CreateClusterResponse = CreateClusterResponse
    { _cwCluster :: Maybe Cluster
      -- ^ Describes a cluster.
    } deriving (Show, Generic)

-- | Describes a cluster.
cwCluster :: Lens' CreateClusterResponse (Maybe Cluster)
cwCluster f x =
    f (_cwCluster x)
        <&> \y -> x { _cwCluster = y }
{-# INLINE cwCluster #-}

instance FromXML CreateClusterResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest CreateCluster where
    type Sv CreateCluster = Redshift
    type Rs CreateCluster = CreateClusterResponse

    request = post "CreateCluster"
    response _ = xmlResponse
