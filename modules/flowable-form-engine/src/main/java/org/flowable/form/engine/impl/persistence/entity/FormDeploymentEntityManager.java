/* Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.flowable.form.engine.impl.persistence.entity;

import java.util.List;
import java.util.Map;

import org.flowable.common.engine.impl.persistence.entity.EntityManager;
import org.flowable.form.api.FormDeployment;
import org.flowable.form.engine.impl.FormDeploymentQueryImpl;

/**
 * @author Tijs Rademakers
 */
public interface FormDeploymentEntityManager extends EntityManager<FormDeploymentEntity> {

    List<FormDeployment> findDeploymentsByQueryCriteria(FormDeploymentQueryImpl deploymentQuery);

    List<String> getDeploymentResourceNames(String deploymentId);

    List<FormDeployment> findDeploymentsByNativeQuery(Map<String, Object> parameterMap);

    long findDeploymentCountByNativeQuery(Map<String, Object> parameterMap);

    long findDeploymentCountByQueryCriteria(FormDeploymentQueryImpl deploymentQuery);

    void deleteDeployment(String deploymentId);

}