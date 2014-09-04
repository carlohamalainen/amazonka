{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.STS.V2011_06_15.AssumeRoleWithWebIdentity
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Returns a set of temporary security credentials for users who have been
-- authenticated in a mobile or web application with a web identity provider,
-- such as Login with Amazon, Facebook, or Google. Calling
-- AssumeRoleWithWebIdentity does not require the use of AWS security
-- credentials. Therefore, you can distribute an application (for example, on
-- mobile devices) that requests temporary security credentials without
-- including long-term AWS credentials in the application, and without
-- deploying server-based proxy services that use long-term AWS credentials.
-- Instead, the identity of the caller is validated by using a token from the
-- web identity provider. The temporary security credentials returned by this
-- API consist of an access key ID, a secret access key, and a security token.
-- Applications can use these temporary security credentials to sign calls to
-- AWS service APIs. The credentials are valid for the duration that you
-- specified when calling AssumeRoleWithWebIdentity, which can be from 900
-- seconds (15 minutes) to 3600 seconds (1 hour). By default, the temporary
-- security credentials are valid for 1 hour. Optionally, you can pass an IAM
-- access policy to this operation. If you choose not to pass a policy, the
-- temporary security credentials that are returned by the operation have the
-- permissions that are defined in the access policy of the role that is being
-- assumed. If you pass a policy to this operation, the temporary security
-- credentials that are returned by the operation have the permissions that
-- are allowed by both the access policy of the role that is being assumed,
-- and the policy that you pass. This gives you a way to further restrict the
-- permissions for the resulting temporary security credentials. You cannot
-- use the passed policy to grant permissions that are in excess of those
-- allowed by the access policy of the role that is being assumed. For more
-- information, see Permissions for AssumeRoleWithWebIdentity in Using
-- Temporary Security Credentials. Before your application can call
-- AssumeRoleWithWebIdentity, you must have an identity token from a supported
-- identity provider and create a role that the application can assume. The
-- role that your application assumes must trust the identity provider that is
-- associated with the identity token. In other words, the identity provider
-- must be specified in the role's trust policy. For more information about
-- how to use web identity federation and the AssumeRoleWithWebIdentity, see
-- the following resources: Creating a Mobile Application with Third-Party
-- Sign-In and Creating Temporary Security Credentials for Mobile Apps Using
-- Third-Party Identity Providers in Using Temporary Security Credentials. Web
-- Identity Federation Playground. This interactive website lets you walk
-- through the process of authenticating via Login with Amazon, Facebook, or
-- Google, getting temporary security credentials, and then using those
-- credentials to make a request to AWS. AWS SDK for iOS and AWS SDK for
-- Android. These toolkits contain sample apps that show how to invoke the
-- identity providers, and then how to use the information from these
-- providers to get and use temporary security credentials. Web Identity
-- Federation with Mobile Applications. This article discusses web identity
-- federation and shows an example of how to use web identity federation to
-- get access to content in Amazon S3. https://sts.amazonaws.com/
-- ?Action=AssumeRoleWithWebIdentity &DurationSeconds=3600
-- &ProviderId=www.amazon.com &RoleSessionName=app1 &Version=2011-06-15
-- &RoleArn=arn%3Aaws%3Aiam%3A%3A000240903217%3Arole%2FFederatedWebIdentityRole
-- &WebIdentityToken=Atza%7CIQEBLjAsAhRFiXuWpUXuRvQ9PZL3GMFcYevydwIUFAHZwXZXX
-- XXXXXXJnrulxKDHwy87oGKPznh0D6bEQZTSCzyoCtL_8S07pLpr0zMbn6w1lfVZKNTBdDansFB
-- mtGnIsIapjI6xKR02Yc_2bQ8LZbUXSGm6Ry6_BG7PrtLZtj_dfCTj92xNGed-CrKqjG7nPBjNI
-- L016GGvuS5gSvPRUxWES3VYfm1wl7WTI7jn-Pcb6M-buCgHhFOzTQxod27L9CqnOLio7N3gZAG
-- psp6n1-AJBOCJckcyXe2c6uD0srOJeZlKUm2eTDVMf8IehDVI0r1QOnTV6KzzAI3OY87Vd_cVMQ
-- amzn1.account.AF6RHO7KZU5XRVQJGXK6HB56KR2A
-- arn:aws:sts::000240903217:assumed-role/FederatedWebIdentityRole/app1
-- AROACLKWSDQRAOFQC3IDI:app1 AQoDYXdzEE0a8ANXXXXXXXXNO1ewxE5TijQyp+IPfnyowF
-- wJalrXUtnFEMI/K7MDENG/bPxRfiCYzEXAMPLEKEY 2013-05-14T23:00:23Z
-- AKIAIOSFODNN7EXAMPLE apps.example.com
-- client.5498841531868486423.1548@apps.example.com
-- ad4156e9-bce1-11e2-82e6-6b6ef249e618.
module Network.AWS.STS.V2011_06_15.AssumeRoleWithWebIdentity
    (
    -- * Request
      AssumeRoleWithWebIdentity
    -- ** Request constructor
    , assumeRoleWithWebIdentity
    -- ** Request lenses
    , arwwirRoleArn
    , arwwirWebIdentityToken
    , arwwirRoleSessionName
    , arwwirDurationSeconds
    , arwwirPolicy
    , arwwirProviderId

    -- * Response
    , AssumeRoleWithWebIdentityResponse
    -- ** Response lenses
    , arwwisAssumedRoleUser
    , arwwisAudience
    , arwwisCredentials
    , arwwisProvider
    , arwwisPackedPolicySize
    , arwwisSubjectFromWebIdentityToken
    ) where

import Network.AWS.Request.Query
import Network.AWS.STS.V2011_06_15.Types
import Network.AWS.Prelude

-- | Minimum specification for a 'AssumeRoleWithWebIdentity' request.
assumeRoleWithWebIdentity :: Text -- ^ 'arwwirRoleArn'
                          -> Text -- ^ 'arwwirWebIdentityToken'
                          -> Text -- ^ 'arwwirRoleSessionName'
                          -> AssumeRoleWithWebIdentity
assumeRoleWithWebIdentity p1 p2 p3 = AssumeRoleWithWebIdentity
    { _arwwirRoleArn = p1
    , _arwwirWebIdentityToken = p2
    , _arwwirRoleSessionName = p3
    , _arwwirDurationSeconds = Nothing
    , _arwwirPolicy = Nothing
    , _arwwirProviderId = Nothing
    }
{-# INLINE assumeRoleWithWebIdentity #-}

data AssumeRoleWithWebIdentity = AssumeRoleWithWebIdentity
    { _arwwirRoleArn :: Text
      -- ^ The Amazon Resource Name (ARN) of the role that the caller is
      -- assuming.
    , _arwwirWebIdentityToken :: Text
      -- ^ The OAuth 2.0 access token or OpenID Connect ID token that is
      -- provided by the identity provider. Your application must get this
      -- token by authenticating the user who is using your application
      -- with a web identity provider before the application makes an
      -- AssumeRoleWithWebIdentity call.
    , _arwwirRoleSessionName :: Text
      -- ^ An identifier for the assumed role session. Typically, you pass
      -- the name or identifier that is associated with the user who is
      -- using your application. That way, the temporary security
      -- credentials that your application will use are associated with
      -- that user. This session name is included as part of the ARN and
      -- assumed role ID in the AssumedRoleUser response element.
    , _arwwirDurationSeconds :: Maybe Integer
      -- ^ The duration, in seconds, of the role session. The value can
      -- range from 900 seconds (15 minutes) to 3600 seconds (1 hour). By
      -- default, the value is set to 3600 seconds.
    , _arwwirPolicy :: Maybe Text
      -- ^ An IAM policy in JSON format. The policy parameter is optional.
      -- If you pass a policy, the temporary security credentials that are
      -- returned by the operation have the permissions that are allowed
      -- by both the access policy of the role that is being assumed, and
      -- the policy that you pass. This gives you a way to further
      -- restrict the permissions for the resulting temporary security
      -- credentials. You cannot use the passed policy to grant
      -- permissions that are in excess of those allowed by the access
      -- policy of the role that is being assumed. For more information,
      -- see Permissions for AssumeRoleWithWebIdentity in Using Temporary
      -- Security Credentials.
    , _arwwirProviderId :: Maybe Text
      -- ^ The fully-qualified host component of the domain name of the
      -- identity provider. Specify this value only for OAuth access
      -- tokens. Do not specify this value for OpenID Connect ID tokens,
      -- such as accounts.google.com. Do not include URL schemes and port
      -- numbers. Currently, www.amazon.com and graph.facebook.com are
      -- supported.
    } deriving (Show, Generic)

-- | The Amazon Resource Name (ARN) of the role that the caller is assuming.
arwwirRoleArn :: Lens' AssumeRoleWithWebIdentity (Text)
arwwirRoleArn f x =
    f (_arwwirRoleArn x)
        <&> \y -> x { _arwwirRoleArn = y }
{-# INLINE arwwirRoleArn #-}

-- | The OAuth 2.0 access token or OpenID Connect ID token that is provided by
-- the identity provider. Your application must get this token by
-- authenticating the user who is using your application with a web identity
-- provider before the application makes an AssumeRoleWithWebIdentity call.
arwwirWebIdentityToken :: Lens' AssumeRoleWithWebIdentity (Text)
arwwirWebIdentityToken f x =
    f (_arwwirWebIdentityToken x)
        <&> \y -> x { _arwwirWebIdentityToken = y }
{-# INLINE arwwirWebIdentityToken #-}

-- | An identifier for the assumed role session. Typically, you pass the name or
-- identifier that is associated with the user who is using your application.
-- That way, the temporary security credentials that your application will use
-- are associated with that user. This session name is included as part of the
-- ARN and assumed role ID in the AssumedRoleUser response element.
arwwirRoleSessionName :: Lens' AssumeRoleWithWebIdentity (Text)
arwwirRoleSessionName f x =
    f (_arwwirRoleSessionName x)
        <&> \y -> x { _arwwirRoleSessionName = y }
{-# INLINE arwwirRoleSessionName #-}

-- | The duration, in seconds, of the role session. The value can range from 900
-- seconds (15 minutes) to 3600 seconds (1 hour). By default, the value is set
-- to 3600 seconds.
arwwirDurationSeconds :: Lens' AssumeRoleWithWebIdentity (Maybe Integer)
arwwirDurationSeconds f x =
    f (_arwwirDurationSeconds x)
        <&> \y -> x { _arwwirDurationSeconds = y }
{-# INLINE arwwirDurationSeconds #-}

-- | An IAM policy in JSON format. The policy parameter is optional. If you pass
-- a policy, the temporary security credentials that are returned by the
-- operation have the permissions that are allowed by both the access policy
-- of the role that is being assumed, and the policy that you pass. This gives
-- you a way to further restrict the permissions for the resulting temporary
-- security credentials. You cannot use the passed policy to grant permissions
-- that are in excess of those allowed by the access policy of the role that
-- is being assumed. For more information, see Permissions for
-- AssumeRoleWithWebIdentity in Using Temporary Security Credentials.
arwwirPolicy :: Lens' AssumeRoleWithWebIdentity (Maybe Text)
arwwirPolicy f x =
    f (_arwwirPolicy x)
        <&> \y -> x { _arwwirPolicy = y }
{-# INLINE arwwirPolicy #-}

-- | The fully-qualified host component of the domain name of the identity
-- provider. Specify this value only for OAuth access tokens. Do not specify
-- this value for OpenID Connect ID tokens, such as accounts.google.com. Do
-- not include URL schemes and port numbers. Currently, www.amazon.com and
-- graph.facebook.com are supported.
arwwirProviderId :: Lens' AssumeRoleWithWebIdentity (Maybe Text)
arwwirProviderId f x =
    f (_arwwirProviderId x)
        <&> \y -> x { _arwwirProviderId = y }
{-# INLINE arwwirProviderId #-}

instance ToQuery AssumeRoleWithWebIdentity where
    toQuery = genericQuery def

data AssumeRoleWithWebIdentityResponse = AssumeRoleWithWebIdentityResponse
    { _arwwisAssumedRoleUser :: Maybe AssumedRoleUser
      -- ^ The Amazon Resource Name (ARN) and the assumed role ID, which are
      -- identifiers that you can use to refer to the resulting temporary
      -- security credentials. For example, you can reference these
      -- credentials as a principal in a resource-based policy by using
      -- the ARN or assumed role ID. The ARN and ID include the
      -- RoleSessionName that you specified when you called AssumeRole.
    , _arwwisAudience :: Maybe Text
      -- ^ The intended audience of the web identity token. This is
      -- traditionally the client identifier issued to the application
      -- that requested the web identity token.
    , _arwwisCredentials :: Maybe Credentials
      -- ^ The temporary security credentials, which include an access key
      -- ID, a secret access key, and a security token.
    , _arwwisProvider :: Maybe Text
      -- ^ The issuing authority of the web identity token presented. For
      -- OpenID Connect ID Tokens this contains the value of the iss
      -- field. For OAuth 2.0 Access Tokens, this contains the value of
      -- the ProviderId parameter that was passed in the
      -- AssumeRoleWithWebIdentity request.
    , _arwwisPackedPolicySize :: Maybe Integer
      -- ^ A percentage value that indicates the size of the policy in
      -- packed form. The service rejects any policy with a packed size
      -- greater than 100 percent, which means the policy exceeded the
      -- allowed space.
    , _arwwisSubjectFromWebIdentityToken :: Maybe Text
      -- ^ The unique user identifier that is returned by the identity
      -- provider. This identifier is associated with the WebIdentityToken
      -- that was submitted with the AssumeRoleWithWebIdentity call. The
      -- identifier is typically unique to the user and the application
      -- that acquired the WebIdentityToken (pairwise identifier). If an
      -- OpenID Connect ID token was submitted in the WebIdentityToken,
      -- this value is returned by the identity provider as the token's
      -- sub (Subject) claim.
    } deriving (Show, Generic)

-- | The Amazon Resource Name (ARN) and the assumed role ID, which are
-- identifiers that you can use to refer to the resulting temporary security
-- credentials. For example, you can reference these credentials as a
-- principal in a resource-based policy by using the ARN or assumed role ID.
-- The ARN and ID include the RoleSessionName that you specified when you
-- called AssumeRole.
arwwisAssumedRoleUser :: Lens' AssumeRoleWithWebIdentityResponse (Maybe AssumedRoleUser)
arwwisAssumedRoleUser f x =
    f (_arwwisAssumedRoleUser x)
        <&> \y -> x { _arwwisAssumedRoleUser = y }
{-# INLINE arwwisAssumedRoleUser #-}

-- | The intended audience of the web identity token. This is traditionally the
-- client identifier issued to the application that requested the web identity
-- token.
arwwisAudience :: Lens' AssumeRoleWithWebIdentityResponse (Maybe Text)
arwwisAudience f x =
    f (_arwwisAudience x)
        <&> \y -> x { _arwwisAudience = y }
{-# INLINE arwwisAudience #-}

-- | The temporary security credentials, which include an access key ID, a
-- secret access key, and a security token.
arwwisCredentials :: Lens' AssumeRoleWithWebIdentityResponse (Maybe Credentials)
arwwisCredentials f x =
    f (_arwwisCredentials x)
        <&> \y -> x { _arwwisCredentials = y }
{-# INLINE arwwisCredentials #-}

-- | The issuing authority of the web identity token presented. For OpenID
-- Connect ID Tokens this contains the value of the iss field. For OAuth 2.0
-- Access Tokens, this contains the value of the ProviderId parameter that was
-- passed in the AssumeRoleWithWebIdentity request.
arwwisProvider :: Lens' AssumeRoleWithWebIdentityResponse (Maybe Text)
arwwisProvider f x =
    f (_arwwisProvider x)
        <&> \y -> x { _arwwisProvider = y }
{-# INLINE arwwisProvider #-}

-- | A percentage value that indicates the size of the policy in packed form.
-- The service rejects any policy with a packed size greater than 100 percent,
-- which means the policy exceeded the allowed space.
arwwisPackedPolicySize :: Lens' AssumeRoleWithWebIdentityResponse (Maybe Integer)
arwwisPackedPolicySize f x =
    f (_arwwisPackedPolicySize x)
        <&> \y -> x { _arwwisPackedPolicySize = y }
{-# INLINE arwwisPackedPolicySize #-}

-- | The unique user identifier that is returned by the identity provider. This
-- identifier is associated with the WebIdentityToken that was submitted with
-- the AssumeRoleWithWebIdentity call. The identifier is typically unique to
-- the user and the application that acquired the WebIdentityToken (pairwise
-- identifier). If an OpenID Connect ID token was submitted in the
-- WebIdentityToken, this value is returned by the identity provider as the
-- token's sub (Subject) claim.
arwwisSubjectFromWebIdentityToken :: Lens' AssumeRoleWithWebIdentityResponse (Maybe Text)
arwwisSubjectFromWebIdentityToken f x =
    f (_arwwisSubjectFromWebIdentityToken x)
        <&> \y -> x { _arwwisSubjectFromWebIdentityToken = y }
{-# INLINE arwwisSubjectFromWebIdentityToken #-}

instance FromXML AssumeRoleWithWebIdentityResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest AssumeRoleWithWebIdentity where
    type Sv AssumeRoleWithWebIdentity = STS
    type Rs AssumeRoleWithWebIdentity = AssumeRoleWithWebIdentityResponse

    request = post "AssumeRoleWithWebIdentity"
    response _ = xmlResponse
