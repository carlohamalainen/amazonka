{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Inspector.CreateAssessmentTarget
-- Copyright   : (c) 2013-2018 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Creates a new assessment target using the ARN of the resource group that is generated by 'CreateResourceGroup' . If the <https://docs.aws.amazon.com/inspector/latest/userguide/inspector_slr.html service-linked role> isn’t already registered, also creates and registers a service-linked role to grant Amazon Inspector access to AWS Services needed to perform security assessments. You can create up to 50 assessment targets per AWS account. You can run up to 500 concurrent agents per AWS account. For more information, see <http://docs.aws.amazon.com/inspector/latest/userguide/inspector_applications.html Amazon Inspector Assessment Targets> .
--
--
module Network.AWS.Inspector.CreateAssessmentTarget
    (
    -- * Creating a Request
      createAssessmentTarget
    , CreateAssessmentTarget
    -- * Request Lenses
    , catAssessmentTargetName
    , catResourceGroupARN

    -- * Destructuring the Response
    , createAssessmentTargetResponse
    , CreateAssessmentTargetResponse
    -- * Response Lenses
    , catrsResponseStatus
    , catrsAssessmentTargetARN
    ) where

import Network.AWS.Inspector.Types
import Network.AWS.Inspector.Types.Product
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'createAssessmentTarget' smart constructor.
data CreateAssessmentTarget = CreateAssessmentTarget'
  { _catAssessmentTargetName :: !Text
  , _catResourceGroupARN     :: !Text
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'CreateAssessmentTarget' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'catAssessmentTargetName' - The user-defined name that identifies the assessment target that you want to create. The name must be unique within the AWS account.
--
-- * 'catResourceGroupARN' - The ARN that specifies the resource group that is used to create the assessment target.
createAssessmentTarget
    :: Text -- ^ 'catAssessmentTargetName'
    -> Text -- ^ 'catResourceGroupARN'
    -> CreateAssessmentTarget
createAssessmentTarget pAssessmentTargetName_ pResourceGroupARN_ =
  CreateAssessmentTarget'
    { _catAssessmentTargetName = pAssessmentTargetName_
    , _catResourceGroupARN = pResourceGroupARN_
    }


-- | The user-defined name that identifies the assessment target that you want to create. The name must be unique within the AWS account.
catAssessmentTargetName :: Lens' CreateAssessmentTarget Text
catAssessmentTargetName = lens _catAssessmentTargetName (\ s a -> s{_catAssessmentTargetName = a})

-- | The ARN that specifies the resource group that is used to create the assessment target.
catResourceGroupARN :: Lens' CreateAssessmentTarget Text
catResourceGroupARN = lens _catResourceGroupARN (\ s a -> s{_catResourceGroupARN = a})

instance AWSRequest CreateAssessmentTarget where
        type Rs CreateAssessmentTarget =
             CreateAssessmentTargetResponse
        request = postJSON inspector
        response
          = receiveJSON
              (\ s h x ->
                 CreateAssessmentTargetResponse' <$>
                   (pure (fromEnum s)) <*>
                     (x .:> "assessmentTargetArn"))

instance Hashable CreateAssessmentTarget where

instance NFData CreateAssessmentTarget where

instance ToHeaders CreateAssessmentTarget where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("InspectorService.CreateAssessmentTarget" ::
                       ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON CreateAssessmentTarget where
        toJSON CreateAssessmentTarget'{..}
          = object
              (catMaybes
                 [Just
                    ("assessmentTargetName" .= _catAssessmentTargetName),
                  Just ("resourceGroupArn" .= _catResourceGroupARN)])

instance ToPath CreateAssessmentTarget where
        toPath = const "/"

instance ToQuery CreateAssessmentTarget where
        toQuery = const mempty

-- | /See:/ 'createAssessmentTargetResponse' smart constructor.
data CreateAssessmentTargetResponse = CreateAssessmentTargetResponse'
  { _catrsResponseStatus      :: !Int
  , _catrsAssessmentTargetARN :: !Text
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'CreateAssessmentTargetResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'catrsResponseStatus' - -- | The response status code.
--
-- * 'catrsAssessmentTargetARN' - The ARN that specifies the assessment target that is created.
createAssessmentTargetResponse
    :: Int -- ^ 'catrsResponseStatus'
    -> Text -- ^ 'catrsAssessmentTargetARN'
    -> CreateAssessmentTargetResponse
createAssessmentTargetResponse pResponseStatus_ pAssessmentTargetARN_ =
  CreateAssessmentTargetResponse'
    { _catrsResponseStatus = pResponseStatus_
    , _catrsAssessmentTargetARN = pAssessmentTargetARN_
    }


-- | -- | The response status code.
catrsResponseStatus :: Lens' CreateAssessmentTargetResponse Int
catrsResponseStatus = lens _catrsResponseStatus (\ s a -> s{_catrsResponseStatus = a})

-- | The ARN that specifies the assessment target that is created.
catrsAssessmentTargetARN :: Lens' CreateAssessmentTargetResponse Text
catrsAssessmentTargetARN = lens _catrsAssessmentTargetARN (\ s a -> s{_catrsAssessmentTargetARN = a})

instance NFData CreateAssessmentTargetResponse where
